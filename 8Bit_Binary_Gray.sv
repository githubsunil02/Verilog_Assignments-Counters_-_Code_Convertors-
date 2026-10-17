
module binary_to_gray (
    input  [7:0] B,  // 8-bit binary input
    output [7:0] G   // 8-bit Gray code output
);

    // The most significant bit (MSB) remains unchanged
    assign G[7] = B[7];

    // XOR each pair of adjacent binary bits
    // Gray bit = Current binary bit XOR Previous higher bit

    assign G[6] = B[7] ^ B[6];
    assign G[5] = B[6] ^ B[5];
    assign G[4] = B[5] ^ B[4];
    assign G[3] = B[4] ^ B[3];
    assign G[2] = B[3] ^ B[2];
    assign G[1] = B[2] ^ B[1];
    assign G[0] = B[1] ^ B[0];

endmodule


// Testbench for Binary-to-Gray Code Converter
module tb_binary_to_gray;

    reg  [7:0] B;  // Register to apply binary test inputs
    wire [7:0] G;  // Wire to observe Gray code output

    // Instantiate the design under test (DUT)
    binary_to_gray dut (
        .B(B),
        .G(G)
    );

    initial begin
        // Display input and output whenever either changes
        $monitor("Time=%0t | Binary=%b | Gray=%b", $time, B, G);

        // Apply different binary input patterns
        B = 8'b00000000; #10;
        B = 8'b00000001; #10;
        B = 8'b00000010; #10;
        B = 8'b00000011; #10;
        B = 8'b00000100; #10;
        B = 8'b00000101; #10;
        B = 8'b00001010; #10;
        B = 8'b11111111; #10;

        // End the simulation
        $finish;
    end

endmodule
