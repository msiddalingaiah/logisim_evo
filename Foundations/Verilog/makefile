
# Be sure to create vcd directory first

adder: Adder.v
	iverilog -g2009 -o vcd/TestBench Adder.v
	vvp vcd/TestBench

cdiv: ClockDivider.v
	iverilog -g2009 -o vcd/TestBench ClockDivider.v
	vvp vcd/TestBench

shiftreg: ShiftRegister.v
	iverilog -g2009 -o vcd/TestBench ShiftRegister.v
	vvp vcd/TestBench

counter: SyncCounter.v
	iverilog -g2009 -o vcd/TestBench SyncCounter.v
	vvp vcd/TestBench

fibonacci: Fibonacci.v
	iverilog -g2009 -o vcd/TestBench Fibonacci.v
	vvp vcd/TestBench

run:
	vvp vcd/TestBench

clean:
	del vcd\TestBench
