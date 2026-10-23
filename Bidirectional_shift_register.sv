// 4-Bit Bidirectional Shift Register
// A bidirectional shift register is a digital sequential logic circuit that can shift its stored data either to the left or to the right based on the state of a control signal. 
// It provides maximum flexibility for data manipulation in digital systems.

// Structual Modeling
module mux2to1(
    input a, b, sel,
    output y
    );
    
    assign y = sel ? b : a;
endmodule

module dff(
    input clk, rst, D,
    output reg Q
    );
    
    always @(posedge clk or posedge rst)
        if (rst)
            Q <= 1'b0;
        else
            Q <= D;
endmodule

module bidirectional_shift_register (
    input clk, rst, dir, serial_in,
    output [3:0] Q
    );
    wire [3:0] D;
    
// dir = 0: Shift right
// dir = 1: Shift left

mux2to1 M0(Q[1], serial_in, dir, D[0]);
mux2to1 M1(Q[2], Q[0], dir, D[1]);
mux2to1 M2(Q[3], Q[1], dir, D[2]);
mux2to1 M3(serial_in, Q[2], dir, D[3]);

    dff F0(clk, rst, D[0], Q[0]);
    dff F1(clk, rst, D[1], Q[1]);
    dff F2(clk, rst, D[2], Q[2]);
    dff F3(clk, rst, D[3], Q[3]);

endmodule


    
