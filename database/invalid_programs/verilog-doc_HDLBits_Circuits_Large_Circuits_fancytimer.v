module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
    
    parameter idle=4'd0, s1=4'd1, s11=4'd2, s110=4'd3, b0=4'd4, b1=4'd5, b2=4'd6, b3=4'd7, counts=4'd8, waiting=4'd9;
    reg [3:0]	state, next_state;
    reg [9:0]	counter;
    always@(*) begin
        case(state)
            idle: begin
                if(data==1'b0)
                    next_state = idle;
                else
                    next_state = s1;
            end
            s1: begin
                if(data==1'b0)
                    next_state = idle;
                else
                    next_state = s11;
            end
            s11: begin
                if(data==1'b0)
                    next_state = s110;
                else
                    next_state = s11;
            end
            s110: begin
                if(data==1'b0)
                    next_state = idle;
                else
                    next_state = b0;
            end
            b0:		next_state = b1;
            b1:		next_state = b2;
            b2:		next_state = b3;
            b3:		next_state = counts;
            counts: begin
                if(count==0 && counter==999)
                    next_state = waiting;
                else
                    next_state = counts;
            end
            waiting: begin
                if(ack)
                    next_state = idle;
                else
                    next_state = waiting;
            end
        endcase
    end
    
    always@(posedge clk) begin
        if(reset) begin
           	count = 4'd0;
            counter = 10'd0;
        end
        else begin
            case(state)
                b0:	count[3] <= data;
                b1:	count[2] <= data;
                b2:	count[1] <= data;
                b3:	count[0] <= data;
                counts:	begin
                    if(count >=0) begin
                        if(counter < 999)
                            counter <= counter + 1'b1;
                        else begin
                            count <= count - 1'b1;
                            counter <= 10'd0;
                        end
                    end
                end
                default:	counter <= 10'd0;
            endcase
        end
    end
    
    always@(posedge clk) begin
        if(reset)
            state <= idle;
        else
            state <= next_state;
    end

    assign	counting = (state==counts);
    assign	done = (state==waiting);
    
endmodule

