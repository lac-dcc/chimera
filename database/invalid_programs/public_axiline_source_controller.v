module controller#(
    parameter logNumCycle=3,
    parameter NumCycle=8
)(
    input clk,
    input start,
    input rst,
    output sel
);
    reg[logNumCycle-1:0] counter;

    localparam IDLE=2'b00, INIT=2'b01, POSE=2'b11;
    reg[1:0]state;

    always @(posedge clk)begin
        if(rst) begin
            state<=IDLE;
            counter<=0;
        end else  begin
            case (current_state)
             IDLE:begin
                 if(start) begin
                     state=INIT;
                     counter<=1;
                 end else begin
                     state<=IDLE;
                    counter<=0;
                 end
             end
             INIT: begin
                 state<=POSE;
                 counter<=counter+1;
             end
             POSE: begin
                 if(counter==NumCycle-1) state<=INIT;
                 else begin
                     counter<=counter+1;
                     state=POSE;
                end
             end
            endcase
        end
    end

    assign sel=state[1];

endmodule