// N-Bit Up counter with Load
// synchronous active Low RESET
module counter_with_load #(
    parameter N = 4
    )(
    input clk, rst, load,
    input [N-1:0] load_val,
    output reg [N-1:0] cnt
    );
    always @(posedge clk) begin
        if (!rst)
            cnt <= load_val;
        else if (load)
            cnt <= load_val;
        else if (cnt == {N{1'b1}})
            cnt <= load_val;
        else 
            cnt <= cnt + 1'b1;
    end
endmodule
