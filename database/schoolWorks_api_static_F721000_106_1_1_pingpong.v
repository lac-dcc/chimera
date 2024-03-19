`define Ball_size 30
`define Buttun_time 32'd100000

module vga(clk ,p1_pos,p2_pos,p1_size,p2_size,ball_posx,ball_posy ,VGA_r,VGA_g,VGA_b,hs,vs);
input clk;
input [9:0]p1_pos,p2_pos;
input [7:0]p1_size,p2_size;
input [10:0]ball_posx;//640
input [9:0]ball_posy;//480
output [3:0]VGA_r,VGA_g,VGA_b;
output hs,vs;
reg [19:0]vt;
reg [10:0]ht;

///////

reg [11:0] hc,hcount,r,g,b;  // VGA horizontal counter
reg [10:0] vc,vcount;  // VGA vertical counter

wire hcount_ov,vcount_ov,video_active;
// VGA mode parameters
parameter
    hsync_end   = 12'd119,
    hdat_begin  = 12'd242,
    hdat_end    = 12'd1266,
    hpixel_end  = 12'd1345,
    vsync_end   = 11'd5,
    vdat_begin  = 11'd32,
    vdat_end    = 11'd632,
    vline_end   = 11'd665;
always@(posedge clk) hcount<=(hcount_ov)? 12'd0:(hcount+12'd1);
always@(posedge clk) vcount<=(hcount_ov)? (vcount_ov)? 11'd0:(vcount+11'd1):vcount;
assign hcount_ov=hcount == hpixel_end;
assign vcount_ov=vcount == vline_end;
assign video_active=hdat_begin<=hcount&&hcount<hdat_end&&
                    vdat_begin<=vcount&&vcount<vdat_end;
assign hs=hcount>hsync_end;
assign vs=vcount>vsync_end;

assign VGA_r=(video_active)? r[3:0]:0;
assign VGA_g=(video_active)? g[3:0]:0;
assign VGA_b=(video_active)? b[3:0]:0;

// generate "image",p.s.:you can only use clk there,or it will too late to
// show image
always@(posedge clk)
begin
    vc<=vcount-vdat_begin;
    hc<=hcount-hdat_begin;
    //show ball
    if( (hc>=ball_posx)&&(hc<(ball_posx+`Ball_size))&&
        (vc>=ball_posy)&&(vc<(ball_posy+`Ball_size)))
    begin
        r<=12;
        g<=6;
        b<=0;
    end
    else
    begin
        r<=15;
        g<=15;
        b<=15;
    end
    //show player1
    if( hc>10'd30&&hc<=10'd62&&
        vc>=p1_pos&&vc<(p1_pos+p1_size))
    begin
        r<=r-((hc-30)>>1);
        g<=g-((hc-30)>>1);
    end
    else
    begin
        //show player2
        if( hc>10'd962&&hc<=10'd994&&
            vc>=p2_pos&&vc<(p2_pos+p2_size))
        begin
            g<=g-((962-hc)>>1);
            b<=b-((962-hc)>>1);
        end
    end
end
endmodule

module ball_pos(b_clk,b_rst,ball_posx,ball_posy,p1_pos,p2_pos,p1_size,p2_size);
input b_clk,b_rst;
input [9:0]p1_pos,p2_pos;
input [7:0]p1_size,p2_size;
output [10:0]ball_posx;
output [9:0]ball_posy;
reg [10:0]ball_posx;
reg [9:0]ball_posy;
reg [1:0]direction;//0:x,1:y//0:+,1:-

always@(posedge b_clk,negedge b_rst)
begin
    if(!b_rst)
    begin
        ball_posx<=11'd305;
        ball_posy<=10'd100;
        direction<=2'd0;
    end
    else
    begin
        //bounce
        if(ball_posy<=3)
            direction[1]<=0;
        if((ball_posy+`Ball_size)>=600)
            direction[1]<=1;
        if(ball_posx==62&&(ball_posy+`Ball_size)>=p1_pos&&ball_posy<(p1_pos+p1_size))
            direction[0]<=0;
        if((ball_posx+`Ball_size)==962&&(ball_posy+`Ball_size)>=p2_pos&&ball_posy<(p2_pos+p2_size))//player 2 defend
            direction[0]<=1;
        //ball move
        ball_posx<=ball_posx+((direction[0])? -1:1);
        ball_posy<=ball_posy+((direction[1])? -1:1);
    end
end
endmodule

module player_move(rst,clk,in,size,pos);
input rst,clk;
input [1:0]in;
input [7:0]size;
output [9:0]pos;
reg [9:0]pos;
reg [31:0]count;
always@(posedge clk,negedge rst)
begin
    if(!rst)
    begin
        pos<=10'd210;
        count<=32'd0;
    end
    else
    begin
        if(count==`Buttun_time)
        begin
            count<=32'd0;
            case(in)
                2'b01:pos<=pos+((pos+size)<=600);
                2'b10:pos<=pos-(pos!=0);
                default:pos<=pos;
            endcase
        end
        else count<=count+32'd1;
    end
end
endmodule

module game_rule_setter(rst,clk,p1_point,p2_point,rule ,p1_size,p2_size,b_clk);
input rst,clk;
input [3:0]p1_point,p2_point;
input [2:0]rule;//0:size,1:speed
output [7:0]p1_size,p2_size;
output b_clk;
reg [7:0]p1_size,p2_size;
reg b_clk;
reg [31:0]count,clock,shrink;
always@(posedge clk,negedge rst)
begin
    if(!rst)
    begin
        clock<=32'd100000;
        count<=32'd0;
        p1_size<=8'd200;
        p2_size<=8'd200;
    end
    else
    begin
        if(count==clock)
        begin
            count<=32'd0;
            //let ball move faster
            clock<=clock-(32'd4)*rule[1];
            b_clk<=1'b1;
            //let player smaller
            //(it may have bug when ball faster,player shrink faster,need fix)
            shrink<=shrink+1;
            if(!(shrink%40))
            begin
                p1_size<=p1_size-rule[0]*(p1_size>60);
                p2_size<=p2_size-rule[0]*(p2_size>60);
            end
        end
        else
        begin
            count<=count+32'd1;
            b_clk=1'b0;
        end
        //end game,player disappear
        if((rule[2]&&((p1_point+p2_point)>=5))||((p1_point+p2_point)>=3))
        begin
            if(p1_point>p2_point)
                p2_size<=0;
            else
                p1_size<=0;
        end
    end
end
endmodule

module seven_segment(clk,rst,point,out);
input clk,rst;
input [3:0]point;
output [6:0]out;
reg [6:0]out;
always@(posedge clk,negedge rst)
begin
    if(!rst)
    begin
        out=7'b0111111;
    end
    else
    begin
        case(point)
            4'h0:out=7'b1000000;
            4'h1:out=7'b1111001;
            4'h2:out=7'b0100100;
            4'h3:out=7'b0110000;
            4'h4:out=7'b0011001;
            4'h5:out=7'b0010010;
            4'h6:out=7'b0000010;
            4'h7:out=7'b1011000;
            4'h8:out=7'b0000000;
            4'h9:out=7'b0010000;
            4'ha:out=7'b0001000;
            4'hb:out=7'b0000011;
            4'hc:out=7'b1000110;
            4'hd:out=7'b0100001;
            4'he:out=7'b0000110;
            4'hf:out=7'b0001110;
        endcase
    end
end
endmodule

module referee(rst,clk ,ball_posx ,b_rst,seven_1,seven_2,seven_3,p1_point,p2_point);
input rst,clk;
input [10:0]ball_posx;
output b_rst;
output [6:0]seven_1,seven_2,seven_3;//seven segment
output [3:0]p1_point,p2_point;
reg b_rst;
reg [3:0]p1_point,p2_point;
seven_segment scorer_1 (.clk(clk),.rst(rst),.point(p1_point),.out(seven_1));//"p1"
seven_segment scorer_2 (.clk(clk),.rst(1'd0),.point(4'd0),.out(seven_2));//"-"
seven_segment scorer_3 (.clk(clk),.rst(rst),.point(p2_point),.out(seven_3));//"p2"
always@(posedge clk,negedge rst)
begin
    if(!rst)
    begin
        b_rst=1'd0;
        p1_point=4'd0;
        p2_point=4'd0;
    end
    else
    begin
        //player 2 got point
        if(ball_posx==0)
        begin
            b_rst=1'd0;
            p2_point=p2_point+1;
        end
        else
        begin
            //player 1 got point
            if(ball_posx+`Ball_size==1024)
            begin
                b_rst=1'd0;
                p1_point=p1_point+1;
            end
            else
                b_rst=1'd1;
        end
    end
end
endmodule

module pingpong(rst,clk ,rule,p1,p2,r,g,b,hs,vs,seven_1,seven_2,seven_3);
input rst,clk;
input [2:0]rule;
input [1:0]p1,p2;
output [3:0]r,g,b;
output hs,vs;
output [6:0]seven_1,seven_2,seven_3;//seven segment,//"p1" "-" "p2"
wire [7:0]p1_size,p2_size;
wire [3:0]p1_point,p2_point;
wire [9:0]p1_pos,p2_pos;
wire b_clk;
wire [10:0]ball_posx;
wire [9:0]ball_posy;

game_rule_setter rule_holder (.rst(b_rst),.clk(clk),.p1_point(p1_point),.p2_point(p2_point),.rule(rule),.p1_size(p1_size),.p2_size(p2_size),.b_clk(b_clk));
player_move player1 (.rst(rst),.clk(clk),.in(p1),.size(p1_size),.pos(p1_pos));
player_move player2 (.rst(rst),.clk(clk),.in(p2),.size(p2_size),.pos(p2_pos));
ball_pos ball (
    .b_clk(b_clk),.b_rst(b_rst),.ball_posx(ball_posx),.ball_posy(ball_posy),
    .p1_pos(p1_pos),.p2_pos(p2_pos),.p1_size(p1_size),.p2_size(p2_size));
vga DIS (
    .clk(clk),
    .p1_pos(p1_pos),.p2_pos(p2_pos),.p1_size(p1_size),.p2_size(p2_size),.ball_posx(ball_posx),.ball_posy(ball_posy),
    .VGA_r(r),.VGA_g(g),.VGA_b(b),.hs(hs),.vs(vs));
referee noob (.rst(rst),.clk(clk),.ball_posx(ball_posx),.b_rst(b_rst),.seven_1(seven_1),.seven_2(seven_2),.seven_3(seven_3),.p1_point(p1_point),.p2_point(p2_point));
endmodule
