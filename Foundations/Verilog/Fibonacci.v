
/*
 * Copyright (c) 2025 Madhu Siddalingaiah
 * See https://github.com/msiddalingaiah/logisim_evo/blob/master/LICENSE
 */

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

// A synchronous counter
module Fibonacci(input wire reset, input wire clock, output wire [7:0] out);
    reg [7:0] a, b, sum;
    assign out = b;

    // Guideline #3: When modeling combinational logic with an "always" block, use blocking assignments ( = ).
    always @(*) begin
        sum = a + b;
    end

    // Guideline #1: When modeling sequential logic, use nonblocking assignments ( <= ).
    always @(posedge clock) begin
        if (reset == 1) begin
            a <= 8'h01;
            b <= 8'h00;
        end else begin
            a <= sum;
            b <= a;
        end
    end
endmodule

/**
 * A clock generator for simulation only.
 * This module is not used during synthesis.
 *
 * See https://d1.amobbs.com/bbs_upload782111/files_33/ourdev_585395BQ8J9A.pdf
 * pp 129
 */
module Clock(output reg clock);
    initial begin
        #0 clock = 0;
    end

    // Assume a fixed requency, 10MHz clock
    always begin
        #50 clock <= ~clock;
    end
endmodule

module TestBench;
    wire clock;
    wire [7:0] result;
    reg reset;

    Clock cg1(clock);
    Fibonacci fib1(reset, clock, result);

    initial begin
        $dumpfile("vcd/TestBench.vcd");
        $dumpvars(0, TestBench);
    end

    initial begin
        #0
        reset = 0;
        // #10 means delay 10 timescale units (10 ns in this case) 
        #10
        reset = 1;
        #100
        reset = 0;
        #1000
        $display("All done!");
        $finish;
    end
endmodule
