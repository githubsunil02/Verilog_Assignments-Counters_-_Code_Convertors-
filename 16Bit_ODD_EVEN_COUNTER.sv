module odd_even_counter(
    input clk, rst, mode,
    output reg [15:0] count
    );

  // Clock ka rising edge aane par counter update hoga. Reset 1 hote hi counter zero ho jayega.
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            //   Reset Counter to 0
            count <= 16'd0;     
        end
      else if (mode == 1'b1) begin       // Agar mode 1 hai, toh even counting karni hai
            // Even Counter: 0, 2, 4, 6....
            if (count == 16'd0)
                count <= 16'd2;
        else if(count[0] == 1'b0)    // It's Checking Current Number ODD or EVEN
                count <= count + 16'd2;     // Jo bhi Current count hoga, Current count mein 2 add karo.
            else  
                count <= count + 16'd1;      // nahi to 1 add karo
        end
        else begin
            // ODD Counter : 1,3,5,7,....
            if (count == 16'd0)
                count <= 16'd1;
            else if (count[0] == 1'b0)
                count <= count + 16'd1;
            else
                count <= count + 16'd2;
        end
    end

endmodule            

// TestBench
module tb_odd_even_counter;
    
    reg clk;
    reg rst;
    reg mode;
    
    wire [15:0] count;
    
    // Initiate the counter
    always #5 clk = ~clk;
    
    initial begin
        clk = 1'b0;
        rst = 1'b1;
        mode = 1'b1;   // Even mode
        
        // Release reset
        #12 rst = 1'b0;
        
        // count even Numbers
            #40 mode = 1'b0;

        // Switch to odd counting
        #60 $finish;
    end

    // Display simulation results
    initial begin
        $monitor("Time=%0t | Mode=%b | Count=%0d",
                 $time, mode, count);
    end

endmodule
        
    
