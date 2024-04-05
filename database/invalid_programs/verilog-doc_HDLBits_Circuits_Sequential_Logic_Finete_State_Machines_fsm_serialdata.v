module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); 
    reg [3:0] i;
    parameter RECV=0, DONE=1, READY=3, ERROR=4;
    reg [2:0] state, next_state;
    reg [7:0] data;

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
                    data[i] <= in;
                end
            end
            DONE: begin
                next_state <= in ? READY : RECV;
                out_byte <= data;
            end
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

