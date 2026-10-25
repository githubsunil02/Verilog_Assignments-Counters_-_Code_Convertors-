// Design: Dual Gray Code Converter
// Converts 4-bit and 3-bit binary inputs to Gray code
// Modeling: Dataflow Modeling

module dual_grey(
    input [3:0] bin4,
    input [2:0] bin3,
    
    output [3:0] grey4,
    output [2:0] grey3
    
    );
// 4-Bit Binary_to_Grey Conversion
assign grey4[3] = bin4[3];
assign grey4[2] = bin4[3] ^ bin4[2];
assign grey4[1] = bin4[2] ^ bin4[1];
assign grey4[0] = bin4[1] ^ bin4[0];

// 3-bit Binary_to_Grey Conversion
assign grey4[2] = bin4[2];
assign grey4[1] = bin4[2] ^ bin4[1];
assign grey4[0] = bin4[1] ^ bin4[0];

endmodule
