module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    
    parameter A=2'b00, B=2'b01, C=2'b10;
    reg [1:0] state, state_next;
    
    always @(posedge clk or posedge areset)
        begin
            if (areset)
            state <= A;
    		else
            state <= state_next;
    	end
    
    always @(*)
        begin
            case (state)
                A: begin
                    if (x) state_next <= B;
                    else   state_next <= A;
                end
                B: begin
                    if (x) state_next <= C;
                    else   state_next <= B;
                end
                C: begin
                    if (x) state_next <= C;
                    else   state_next <= B;
                end
                default:   state_next <= A;
            endcase
        end
    
    assign z = (state == B);
        
endmodule
