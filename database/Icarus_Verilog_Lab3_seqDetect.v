`ifndef SEQ_DETECT
`define SEQ_DETECT
module seqDetect( 
    input inSeq,
    input clk,
    input reset);

    parameter  s0 = 3'b000,
               s1 = 3'b001,
               s2 = 3'b010,
               s3 = 3'b011,
               s4 = 3'b100;
    
    reg [2:0] state;

    always @(posedge clk or posedge reset) begin
        if( reset )
            state <= s0;
        else begin
            // $display("current state = %b ",state);
            // $display("input:= ", inSeq);
            case (state)
                s0 : begin
                    // $display("State0");
                    if (inSeq) 
                        state <= s1;
                    else
                        state <= s0;
                end
                s1 : begin
                    // $display("State1");
                    if (inSeq) 
                        state <= s1;
                    else 
                        state <= s2;
                end
                s2 : begin
                    // $display("State2");
                    if (inSeq) 
                        state <= s3;
                    else 
                        state <= s0;
                end
                s3 : begin
                    // $display("State3");
                    if (inSeq) 
                        state <= s4;
                    else 
                        state <= s2;
                end
                s4 : begin
                    // $display("State4");
                    $display("Sequence detected");
                    if (inSeq) 
                        state <= s1;
                    else 
                        state <= s2;
                end
                
                default: begin
                    $display("Default state");
                    state <= s0;
                end
            endcase 
        end
    end
endmodule
`endif