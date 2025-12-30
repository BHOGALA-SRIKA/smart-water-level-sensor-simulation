`timescale 1ns/1ps
module tb_water_level_controller;
    reg S1, S2, S3;
    reg clk, rst;
    wire motor;

    // Instantiate DUT
    water_level_controller uut (
        .S1(S1),
        .S2(S2),
        .S3(S3),
        .clk(clk),
        .rst(rst),
        .motor(motor)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Initialize signals first
        S1 = 0; S2 = 0; S3 = 0;
        rst = 1;

        // Small wait for initialization
        #10 rst = 0;

        // Now start dumpfile *after* everything is stable
        #5;
        $dumpfile("water_level.vcd");
        $dumpvars(0, tb_water_level_controller);

        // Display header
        $display("Time\tS1 S2 S3 | Motor");
        $monitor("%0t\t%b  %b  %b  |   %b", $time, S1, S2, S3, motor);

        // Simulation sequence
        #20; S1=1; S2=0; S3=0;
        #20; S1=1; S2=1; S3=0;
        #20; S1=1; S2=1; S3=1;
        #20; S3=0;
        #20; S2=0;
        #20; S1=0;

        #20; $finish;
    end
endmodule
