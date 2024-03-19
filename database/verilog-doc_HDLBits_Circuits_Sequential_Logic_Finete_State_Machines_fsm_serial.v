module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    reg [3:0] i;
    parameter RECV=0, DONE=1, READY=3, ERROR=4;
    reg [2:0] state, next_state;

    always @(*) begin
        case (state)
            READY: next_state <= in ? READY : RECV;
            RECV: begin
                if((i==8)&in) begin
                    next_state <= DONE;
                end else if((i==8)&(~in)) begin
                    next_state <= ERROR;
                end else begin
                    next_state <= RECV;
                end
            end
            DONE: next_state <= in ? READY : RECV;
            ERROR: next_state <= in ? READY : ERROR;
        endcase
    end

    always @(posedge clk) begin
        if(reset) begin
            state <= READY;
            i <= 0;
        end else begin
            if((state == RECV)&&(i!=8)) begin
                i <= i + 1;
            end else if(state == ERROR) begin
                i <= 0;
            end else if(state == DONE) begin
                i <= 0;
            end
            state <= next_state;
        end
    end
    assign done = (state == DONE);

    
endmodule

