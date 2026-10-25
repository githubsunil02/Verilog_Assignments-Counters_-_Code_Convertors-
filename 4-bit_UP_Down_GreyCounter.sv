// 4-Bit Up_Down Counter
// Behavioral Modeling

module grey_counter(
    input clk, rst, up_down,      // Up_Down - 1:UP, 0:Down
    output reg [3:0] grey
);

reg [3:0] binary;

//Convert Binary_To_Grey
function [3:0] bin_to_grey;
    input [3:0] bin;
    begin
        bin_to_grey = bin ^ (bin >> 1);
    end
endfunction

always @(posedge clk or posedge rst) begin
    if (rst) begin
        binary <= 4'b0000;
        grey   <= 4'b0000;
    end
    else begin
        if (up_down)
            binary <= binary + 1'b1;
        else
            binary <= binary - 1'b1;
        if (up_down)
            grey <= bin_to_grey(binary + 1'b1);
        else
            grey <= bin_to_grey(binary - 1'b1);
        end
    end
endmodule

