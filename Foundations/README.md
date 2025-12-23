
# Foundations

Logic design can be divided into two broad categories:

1. Combinational logic
2. Sequential logic

Combinational logic is made of well known boolean gates such as AND, OR, XOR, NOT, NAND, NOR etc. Combinational logic is *asynchronous*, meaning the output of combinational logic changes directly in response to any input, it has no memory. In practice some small propagation delay is present, typically on the order of nanoseconds depending on logic family, output load, supply voltage, etc.

Combinational logic can be used exclusively to implement many types of computation, such as addition, subtraction, and even multiplication. In fact all of these types of computation can be built using exclusively NAND or NOR gates.

Sequential logic is *synchronous*, meaning the outputs change in response to the inputs *and* distinct clock signal. Sequential logic has memory, meaning it can maintain state or change state under specific control. Simple sequential logic can be used to build counters, shift registers, or transfer values from one register to another. This last operation is of particular interest when building more complex logical systems, such as CPUs.

In practice, combinational and sequential logic are used together to build arbitrarily complex systems. Much of the abstract [automata theory](https://en.wikipedia.org/wiki/Automata_theory) was developed in the mid 20th century by giants such as [Claude Shannon](https://en.wikipedia.org/wiki/Claude_Shannon), [Edward F. Moore](https://en.wikipedia.org/wiki/Edward_F._Moore), [George H. Mealy](https://en.wikipedia.org/wiki/George_H._Mealy), and of course [Alan Turing](https://en.wikipedia.org/wiki/Alan_Turing), among many others. The formal theory can appear mathematically dense, but it's conceptually simple.

## Combinational Logic

TBD

## Sequential Logic

Let's start with a one bit storage element known as a [D-type flip flop](https://en.wikipedia.org/wiki/Flip-flop_(electronics)#D_flip-flop). For the purposes of this discussion, a D-type flip flop is *edge-triggered* meaning the outputs can only change after the rising edge of the clock input. In modern designs, a common, fixed rate clock controls when outputs change. This wasn't always the cases, but it's generally easier to analyze the performance bounds of a system if the clock rate is fixed. Modern tools greatly simplify analysis of what was tediously done by hand. For these reasons, we will focus on single clock, synchronous designs.

![Clock divider](../images/Clock_divider.png "Clock Divider")

