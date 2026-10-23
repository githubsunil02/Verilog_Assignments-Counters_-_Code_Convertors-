// A Johnson counter is a modified ring counter in which,
// the output from the last flip flop is inverted and fed back as an input to the first.

// Behavioral_Modeling
module johnson_counter(
    input clk,
    input rst,
    output reg [3:0] Q
    );
    
    always @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 4'b0000;      // RESET COUNTER
        else 
            Q <= {Q[2:0], ~Q[3]};    // Shift & Invert MSB
        end
    endmodule
        
// TestBench for 4-bit Johnson Counter

module tb_johnson_counter;

reg clk, rst;
wire [3:0] Q;

// Initiate the Counter
johnson_counter uut(
    .clk(clk),
    .rst(rst),
    .Q(Q)
    );
    
// Generate CLOCK
always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;    // Apply REST
    #10 rst = 0;    // Release RESTE
    
    #100 $finish;  // Stop Stimulation
end

// Display Output
initial begin
    $monitor("Time=%0t rst=%b Q=%b", $time, rst, Q);
end
endmodule
    
