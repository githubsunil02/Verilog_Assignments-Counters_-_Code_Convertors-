module grey_to_binary (
  input [7:0] G,   // Input Grey 8-Bit
  output [7:0] B   // Input Binary 8-Bit
);

// The MSB remains unchange
  assign B[7] = G[7];

// XOR the previous binary bit with the current Gray bit
// to calculate each remaining binary bit
  assign B[6] = B[7] ^ G[6];
  assign B[5] = B[6] ^ G[5];
  assign B[4] = B[5] ^ G[4];
  assign B[3] = B[4] ^ G[3];
  assign B[2] = B[3] ^ G[2];
  assign B[1] = B[2] ^ G[1];
  assign B[0] =B[2] ^ G[1];

endmodule

// TestBench for Grey-to-Binary
module tb_grey_to_binary;
    reg [7:0] G;
    wire [7:0] B;
    
// Initiate the DUT(Design Under Test)
grey_to_binary dut(
    .G(G),
    .B(B)
);
initial begin
    // Display Grey Input & Convert to Binary Output
    $monitor("Time=%0t | Grey=%b | Binary=%b",
               $time,  G, B );
               
    // Apply Different Grey Code test inputs
        G = 8'b00000000; #10;
        G = 8'b00000001; #10;
        G = 8'b00000011; #10;
        G = 8'b00000010; #10;
        G = 8'b00000110; #10;
        G = 8'b00000111; #10;
        G = 8'b00001111; #10;
        G = 8'b10000000; #10;

        // End simulation
        $finish;
    end

endmodule
    
    
