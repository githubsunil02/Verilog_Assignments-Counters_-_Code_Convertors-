// Clock Divide-by-8 using Structural Modelling (100 MHz Input) — Asynchronous Circuit

`timescale 1ns/1ps

// D Flip Flop
module d_ff(
    input D, clk, rst,
    output reg Q
    );
// Logic
always @(posedge clk or posedge rst) begin
    if (rst)
        Q <= 1'b0;
    else
        Q <= D;
    end
endmodule

// Asynchonous divided by 8
module clk_div8(
    input clk_100MHz,
    input rst,
    input q2
    );
    
    wire q0, q1;
    wire d0, d1, d2;

// Feedback Connection For Toggel
    assign d0 = ~q0;
    assign d1 = ~q1;
    assign d2 = ~q2;
    
// First FF : 100/2 = 50MHz
d_ff FF1(
    .D(d0),
    .clk(clk_100MHz),
    .rst(rst),
    .Q(q0)
    );
d_ff FF2(
    .D(d1),
    .clk(q1),
    .rst(rst),
    .Q(q1)
    );
d_ff FF3(
    .D(d2),
    .clk(q2),
    .rst(rst),
    .Q(q2)
    );
endmodule


// FF1 receives the original 100 MHz clock.
// FF2 receives Q0 (50 MHz).
// FF3 receives Q1 (25 MHz).
    
    
