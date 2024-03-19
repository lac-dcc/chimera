module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging );

    reg [2:0] state, next_state;
    parameter LEFT=0, RIGHT=1, LEFT_GROUND=3, RIGHT_GROUND=4, DIG_LEFT=5, DIG_RIGHT=6;
    always @(*) begin
        case (state)
            LEFT: begin
                if(ground) begin
                    if(dig) begin
                        next_state <= DIG_LEFT;
                    end else begin
                        next_state <= bump_left ? RIGHT : LEFT;
                    end
                end else begin
                    next_state <= LEFT_GROUND;
                end
            end
            RIGHT: begin
                if(ground) begin
                    if(dig) begin
                        next_state <= DIG_RIGHT; 
                    end else begin
                        next_state <= bump_right ? LEFT : RIGHT;
                    end
                end else begin
                    next_state <= RIGHT_GROUND;
                end
            end
            LEFT_GROUND: begin
                if(ground) begin
                    next_state <= LEFT;
                end else begin
                    next_state <= LEFT_GROUND;
                end
            end
            RIGHT_GROUND: begin
                if(ground) begin
                    next_state <= RIGHT;
                end else begin
                    next_state <= RIGHT_GROUND;
                end
            end
            DIG_LEFT: begin
                if(ground) begin
                    next_state <= DIG_LEFT;
                end else begin
                    next_state <= LEFT_GROUND;
                end
            end
            DIG_RIGHT: begin
                if(ground) begin
                    next_state <= DIG_RIGHT;
                end else begin
                    next_state <= RIGHT_GROUND;
                end
            end
        endcase
    end

            always @(posedge clk or posedge areset) begin
                if( areset) begin
                    state <= LEFT;
                end else begin
                    state <= next_state;
                end
            end
            
            assign walk_left = (state == LEFT);
            assign walk_right = (state == RIGHT);
            assign aaah = (state == RIGHT_GROUND)||(state == LEFT_GROUND);
            assign digging = (state == DIG_LEFT)||(state == DIG_RIGHT);
endmodule

