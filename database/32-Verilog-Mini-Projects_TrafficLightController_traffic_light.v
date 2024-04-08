module traffic_light (clk, Sa, Sb, Ra, Rb, Ga, Gb, Ya, Yb);
input clk;
input Sa;
input Sb;
inout Ra;
inout Rb;
inout Ga;
inout Gb; 
inout Ya;
inout Yb;
reg Ra_tmp;
reg Rb_tmp;
reg Ga_tmp;
reg Gb_tmp;
reg Ya_tmp;
reg Yb_tmp;
reg[3:0] state;
reg[3:0] nextstate;
parameter[1:0] R = 0;
parameter[1:0] Y = 1;
parameter[1:0] G = 2;
wire[1:0] lightA;
wire[1:0] lightB;
assign Ra = Ra_tmp;
assign Rb = Rb_tmp;
assign Ga = Ga_tmp;
assign Gb = Gb_tmp;
assign Ya = Ya_tmp;
assign Yb = Yb_tmp;
initial
begin
 state = 0;
end
always @(state or Sa or Sb)
begin
 Ra_tmp = 1'b0 ;
 Rb_tmp = 1'b0 ;
 Ga_tmp = 1'b0 ;
 Gb_tmp = 1'b0 ;
 Ya_tmp = 1'b0 ;
 Yb_tmp = 1'b0 ;
 nextstate = 0;
 case (state)
 0, 1, 2, 3, 4 :
 begin Ga_tmp = 1'b1 ;
 Rb_tmp = 1'b1 ;
 nextstate = state + 1 ;
 end
 5 :
 begin
 Ga_tmp = 1'b1 ;
 Rb_tmp = 1'b1 ;
 if (Sb == 1'b1)
 begin
 nextstate = 6 ;
 end
 else
 begin
 nextstate = 5 ;
 end 
 end
 6 :
 begin
 Ya_tmp = 1'b1 ;
 Rb_tmp = 1'b1 ;
 nextstate = 7 ;
 end
 7, 8, 9, 10 :
 begin
 Ra_tmp = 1'b1 ;
 Gb_tmp = 1'b1 ;
 nextstate = state + 1 ;
 end
 11 :
 begin
 Ra_tmp = 1'b1 ;
 Gb_tmp = 1'b1 ;
 if (Sa == 1'b1 | Sb == 1'b0)
 begin
 nextstate = 12 ;
 end 
 else
 begin
 nextstate = 11 ;
 end 
 end
 12 :
 begin
 Ra_tmp = 1'b1 ;
 Yb_tmp = 1'b1 ;
 nextstate = 0 ;
 end
 endcase
end always @(posedge clk)
begin
 state <= nextstate ;
end
assign lightA = (Ra==1'b1) ? R : (Ya==1'b1) ? Y : (Ga==1'b1) ? G : lightA;
assign lightB = (Rb==1'b1) ? R : (Yb==1'b1) ? Y : (Gb==1'b1) ? G : lightB;
endmodule
