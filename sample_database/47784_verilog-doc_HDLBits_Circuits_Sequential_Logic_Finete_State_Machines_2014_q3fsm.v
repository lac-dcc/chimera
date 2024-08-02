// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    parameter a=1'b0, b=1'b1;
    reg state, next_state;
    reg [2:0] w3=0;
    reg [1:0]   count=0;
    
    always@(*) begin
        case({state, s})
            {a, 1'b0}:  next_state = a;
            {a, 1'b1}:  next_state = b;
            {b, 1'b0}:  next_state = b;
            {b, 1'b1}:  next_state = b;
        endcase
    end
    
    always@(posedge clk) begin
        if(reset)
            state <= a;
        else
            state <= next_state;
    end
    
    always@(posedge clk) begin
        if(reset)
            w3 <= 3'b0;
        else if(next_state==b)
            w3 <= {w3[1:0], w};
    end
    
    always@(posedge clk) begin
        if(reset)
            count <= 2'd0;
        else if(next_state == b) begin
            if(count==3)
                count <= 2'd1;
            else begin
                count <= count + 1'b1;
            end
        end
    end

    assign z = (count==1 && (w3==3'b011 || w3==3'b101 || w3==3'b110));

endmodule

