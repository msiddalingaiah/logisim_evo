
/*
 * Copyright (c) 2025 Madhu Siddalingaiah
 * See https://github.com/msiddalingaiah/logisim_evo/blob/master/LICENSE
 */

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

// Circular shift register
module ShiftRegister(input wire reset, input wire clock, output wire [7:0] out);
    reg [7:0] q;

    assign out = q;

    // Guideline #1: When modeling sequential logic, use nonblocking assignments ( <= ).
    always @(posedge clock) begin
        if (reset == 1) begin
            q <= 8'h80;
        end else begin
            q <= { q[0], q[7:1] };
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
    ShiftRegister shift1(reset, clock, result);

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
