// ---------------------------------------------
// File: water_level_controller.v
// Smart Water Level Controller using FSM
// Compatible with Icarus Verilog (pure Verilog)
// ---------------------------------------------
module water_level_controller (
    input S1,    // Bottom sensor
    input S2,    // Middle sensor
    input S3,    // Top sensor
    input clk,
    input rst,
    output reg motor  // Motor output (1 = ON, 0 = OFF)
);

    // Define FSM states using parameters
    parameter EMPTY = 2'b00,
              HALF  = 2'b01,
              FULL  = 2'b10;

    reg [1:0] current_state, next_state;

    // Sequential logic for state transition
    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= EMPTY;
        else
            current_state <= next_state;
    end

    // Combinational logic for next state and output
    always @(*) begin
        next_state = current_state;
        motor = 1'b0;  // Default OFF

        case (current_state)
            EMPTY: begin
                motor = 1'b1;  // Motor ON
                if (S3) next_state = FULL;
                else if (S2) next_state = HALF;
                else next_state = EMPTY;
            end

            HALF: begin
                motor = 1'b1;
                if (S3) next_state = FULL;
                else if (!S1) next_state = EMPTY;
                else next_state = HALF;
            end

            FULL: begin
                motor = 1'b0;  // Motor OFF
                if (!S3) next_state = HALF;
                else next_state = FULL;
            end

            default: begin
                next_state = EMPTY;
                motor = 1'b1;
            end
        endcase
    end
endmodule
