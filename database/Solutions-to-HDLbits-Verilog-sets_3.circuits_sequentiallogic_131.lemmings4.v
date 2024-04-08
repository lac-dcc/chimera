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

    localparam [2:0] WALK_L = 3'b000,
                     WALK_R = 3'b001,
                     FALL_L = 3'b010,
                     FALL_R = 3'b011,
                     DIG_L  = 3'b100,
                     DIG_R  = 3'b101,
                     SPLATTER = 3'b110;

    reg [2:0] state, next;
    reg [6:0] count;

    always @(posedge clk or posedge areset) begin
        if(areset) state <= WALK_L;
        else if(state == FALL_R || state == FALL_L) begin
            count <= count + 1;
            state <= next;
        end
        else begin
            state <= next;
            count <= 0;
        end       
    end

    always @(*) begin
        case(state)
            WALK_L : begin
                if(!ground) next = FALL_L;
                else begin
                    if(dig) next = DIG_L;
                    else begin
                        if(bump_left) next = WALK_R;
                        else next = WALK_L;
                    end
                end
            end
            WALK_R : begin
                if(!ground) next = FALL_R;
                else begin
                    if(dig) next = DIG_R;
                    else begin
                        if(bump_right) next = WALK_L;
                        else next = WALK_R;
                    end
                end
            end
            FALL_L : begin
                if(ground) begin
                    if(count > 19) next = SPLATTER;
                    else next = WALK_L;
                end
                else next = FALL_L;
            end
            FALL_R : begin
                if(ground) begin
                    if(count > 19) next = SPLATTER;
                    else next = WALK_R;
                end
                else next = FALL_R;
            end
            DIG_L  : next = (ground) ? DIG_L : FALL_L;
            DIG_R  : next = (ground) ? DIG_R : FALL_R;
            SPLATTER : next = SPLATTER;
        endcase
    end

    assign walk_left = (state == WALK_L);
    assign walk_right = (state == WALK_R);
    assign aaah = ((state == FALL_L) || (state == FALL_R));
    assign digging = ((state == DIG_L) || (state == DIG_R));

endmodule

