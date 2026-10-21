 // D Flip-Flop
module dff(input D, clk, rst, init, output reg Q);
    always @(posedge clk or posedge rst)
        if (rst) Q <= init;
        else     Q <= D;
endmodule

// 4-Bit Ring Counter
module ring_counter(input clk, rst, output [3:0] Q);

    dff FF0(Q[3], clk, rst, 1'b1, Q[0]);
    dff FF1(Q[0], clk, rst, 1'b0, Q[1]);
    dff FF2(Q[1], clk, rst, 1'b0, Q[2]);
    dff FF3(Q[2], clk, rst, 1'b0, Q[3]);
endmodule

// TESTBENCH
module tb_ring_counter;
    reg clk = 0, rst = 1;
    wire [3:0] Q;
    
    ring_counter uut(clk, rst, Q);
    always #5 clk = ~clk;
    
    initial begin
        #10 rst = 0;
        #60 $finish;
    end
    initial 
        $monitor("Time=%0t | Reset=%b | Q=%b", $time, rst, Q);

endmodule

    
