
/*
 * Copyright (c) 2025 Madhu Siddalingaiah
 * See https://github.com/msiddalingaiah/logisim_evo/blob/master/LICENSE
 */

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

// A trivial module for illustration purposes
module Adder(input wire [7:0] a, input wire [7:0] b, output wire [7:0] out);
    reg [7:0] result;

    assign out = result;

    // Guideline #3: When modeling combinational logic with an "always" block, use blocking assignments ( = ).
    always @(*) begin
        result = a + b;
    end
endmodule

module TestBench;
    reg [7:0] a, b;
    wire [7:0] result;

    // Create an instance of an Adder wired to signals above.
    Adder adder1(a, b, result);

    initial begin
        $dumpfile("vcd/TestBench.vcd");
        $dumpvars(0, TestBench);
    end

    initial begin
        // #10 means delay 10 timescale units (10 ns in this case) 
        #10
        // 8 bit decimal value, 8'hff for hex, 8'b010 for binary, 8'o77 for octal
        a = 8'd3;
        b = 8'd2;
        #90
        a = 8'd7;
        b = 8'd12;
        #100
        $display("Current result is %d", result);
        $finish;
    end
endmodule
