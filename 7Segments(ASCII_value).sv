module seven_segment_decoder(
    input [7:0] ascii,
    output reg [6:0] seg
    );
    
    always @(*) begin
        case (ascii)
        
            // Decimal Digit 0 to 9
            8'h30: seg = 7'b1111110; // 0
            8'h31: seg = 7'b0110000; // 1
        8'h32: seg = 7'b1101101; // 2
        8'h33: seg = 7'b1111001; // 3
        8'h34: seg = 7'b0110011; // 4
        8'h35: seg = 7'b1011011; // 5
        8'h36: seg = 7'b1011111; // 6
        8'h37: seg = 7'b1110000; // 7
        8'h38: seg = 7'b1111111; // 8
        8'h39: seg = 7'b1111011; // 9
        
        // Alphabetic Character ABC... & abc...
        8'h41, 8'h61: seg = 7'b1110111; // A, a
        8'h62:        seg = 7'b0011111; // b
        8'h43, 8'h63: seg = 7'b1001110; // C, c
        8'h64:        seg = 7'b0111101; // d
        8'h45, 8'h65: seg = 7'b1001111; // E, e
        8'h46, 8'h66: seg = 7'b1000111; // F, f
        
        // Unsupported character: display blank
        default: seg = 7'b0000000;

    endcase
end
endmodule
module tb_seven_segment_decoder;

reg [7:0] ascii;
wire [6:0] seg;

seven_segment_decoder dut (
    .ascii(ascii),
    .seg(seg)
);

initial begin
    $monitor("Time=%0t ASCII=%h SEG=%b",
             $time, ascii, seg);

    ascii = 8'h30; #10; // Display 0
    ascii = 8'h31; #10; // Display 1
    ascii = 8'h35; #10; // Display 5
    ascii = 8'h39; #10; // Display 9
    ascii = 8'h41; #10; // Display A
    ascii = 8'h46; #10; // Display F
    ascii = 8'h58; #10; // Unsupported: blank

    $finish;
end

endmodule


        
