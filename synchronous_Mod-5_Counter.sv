// D_FF with Asynchronous RESET
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

// Synchronous Counter
module mod5_counter (
    input clk, rst,
    output [2:0] Q
    );
    wire [2:0] D;
    
    // Next State Logic
    // Next-state logic
    assign D[2] = Q[1] | (Q[2] & ~Q[0]);
    assign D[1] = Q[2] & Q[0];
    assign D[0] = ~Q[2] & ~Q[1] & ~Q[0];

    // Three D flip-flops
    dff FF0(clk, rst, D[0], Q[0]);
    dff FF1(clk, rst, D[1], Q[1]);
    dff FF2(clk, rst, D[2], Q[2]);

endmodule
