//======================================
//
//      intra mode desicion fetch
//		 luyanheng
//
//======================================
module md_fetch(
	clk,
	rstn,
	enable,
	cnt,
	sram_rdata,
	x1,
	x2,
	x3,
	sram_raddr,
	sram_read
);

	input					clk;
	input					rstn;
	input					enable;
	input		[5:0]		cnt;
	input		[31:0]		sram_rdata;
	output		[23:0]		x1;
	output		[15:0]		x2;
	output		[23:0]		x3;
	output					sram_read;
	output		[3:0]		sram_raddr;
	
	reg		[23:0]		x1;
	reg		[15:0]		x2;
	reg		[23:0]		x3;
	
	reg		[31:0]		tmp1;
	reg		[31:0]		tmp2;
	reg		[31:0]		tmp3;
	reg		[31:0]		tmp4;
	reg		[31:0]		tmp5;
	reg		[31:0]		tmp6;
	
	reg					sram_read;
	reg		[3:0]		sram_raddr;
	
always@(posedge clk or negedge rstn)
	if(!rstn)
		begin
			tmp1<='d0;
		    tmp2<='d0;
		    tmp3<='d0;
		    tmp4<='d0;
		    tmp5<='d0;
		    tmp6<='d0;
		end
	else
		case(cnt)
			'd2:begin
				tmp1<=sram_rdata;
				end
			'd3:begin
				tmp2<=sram_rdata;
				end
			'd4:begin
				tmp3<=sram_rdata;
				end
			'd5:begin
				tmp4<=sram_rdata;
				end
			'd6:begin
				tmp5<=sram_rdata;
				end
			'd7:begin
				tmp6<=sram_rdata;
				end
			'd9:begin
				tmp1<=tmp2;
				tmp2<=tmp3;
				tmp3<=sram_rdata;
				end
			'd11:begin
				tmp4<=tmp5;
				tmp5<=tmp6;
				tmp6<=sram_rdata;
				end
			'd15:begin
				tmp1<=tmp2;
				tmp2<=tmp3;
				tmp3<=sram_rdata;
				end
			'd17:begin
				tmp4<=tmp5;
				tmp5<=tmp6;
				tmp6<=sram_rdata;
				end
			'd21:begin
				tmp1<=tmp2;
				tmp2<=tmp3;
				tmp3<=sram_rdata;
				end
			'd23:begin
				tmp4<=tmp5;
				tmp5<=tmp6;
				tmp6<=sram_rdata;
				end
			'd27:begin
				tmp1<=tmp2;
				tmp2<=tmp3;
				tmp3<=sram_rdata;
				end
			'd29:begin
				tmp4<=tmp5;
				tmp5<=tmp6;
				tmp6<=sram_rdata;
				end
			'd33:begin
				tmp1<=tmp2;
				tmp2<=tmp3;
				tmp3<=sram_rdata;
				end
			'd35:begin
				tmp4<=tmp5;
				tmp5<=tmp6;
				tmp6<=sram_rdata;
				end
			default:begin
				tmp1<=tmp1;
			    tmp2<=tmp2;
			    tmp3<=tmp3;
			    tmp4<=tmp4;
			    tmp5<=tmp5;
			    tmp6<=tmp6;
				end
		endcase

always@(posedge clk or negedge rstn)
	if(!rstn)
		begin
			sram_read <= 1'b0;
			sram_raddr <= 'd0;
		end
	else if(enable)
		case(cnt)
			'd0:begin
				sram_read <= 1'b1;
				sram_raddr <= 'd0;
				end
			'd1:begin
				sram_read <= 1'b1;
				sram_raddr <= 'd2;
				end
			'd2:begin
				sram_read <= 1'b1;
				sram_raddr <= 'd4;
				end
			'd3:begin
				sram_read <= 1'b1;
				sram_raddr <= 'd1;
				end
			'd4:begin
				sram_read <= 1'b1;
				sram_raddr <= 'd3;
				end
			'd5:begin
				sram_read <= 1'b1;
				sram_raddr <= 'd5;
				end
			'd7:begin
				sram_read <= 1'b1;
				sram_raddr <= 'd6;
				end
			'd9:begin
				sram_read <= 1'b1;
				sram_raddr <= 'd7;
				end
			'd13:begin
				sram_read <= 1'b1;
				sram_raddr <= 'd8;
				end
			'd15:begin
				sram_read <= 1'b1;
				sram_raddr <= 'd9;
				end
			'd19:begin
				sram_read <= 1'b1;
				sram_raddr <= 'd10;
				end
			'd21:begin
				sram_read <= 1'b1;
				sram_raddr <= 'd11;
				end
			'd25:begin
				sram_read <= 1'b1;
				sram_raddr <= 'd12;
				end
			'd27:begin
				sram_read <= 1'b1;
				sram_raddr <= 'd13;
				end
			'd31:begin
				sram_read <= 1'b1;
				sram_raddr <= 'd14;
				end
			'd33:begin
				sram_read <= 1'b1;
				sram_raddr <= 'd15;
				end
			default:begin
				sram_read <= 'b0;
				sram_raddr <= 'd0;
				end
		endcase
	
always@(posedge clk or negedge rstn)
	if(!rstn)
		begin
			x1 <= 'd0;
			x2 <= 'd0;
			x3 <= 'd0;
		end
	else
	case(cnt)
		'd5,'d11,'d17,'d23,'d29,'d35:	begin
			x1 <= tmp1[31:8];
			x2 <= {tmp2[31:24],tmp2[15:8]};
			x3 <= tmp3[31:8];
				end
		'd6,'d12,'d18,'d24,'d30,'d36:	begin
			x1 <= tmp1[23:0];
			x2 <= {tmp2[23:16],tmp2[7:0]};
			x3 <= tmp3[23:0];
				end
		'd7: begin
			x1 <= {tmp1[15:0],tmp4[31:24]};
			x2 <= {tmp2[15:8],tmp5[31:24]};
			x3 <= {tmp3[15:0],sram_rdata[31:24]};
			end
		'd13,'d19,'d25,'d31,'d37:	begin
			x1 <= {tmp1[15:0],tmp4[31:24]};
			x2 <= {tmp2[15:8],tmp5[31:24]};
			x3 <= {tmp3[15:0],tmp6[31:24]};//tmp
				end
		'd8,'d14,'d20,'d26,'d32,'d38:	begin
			x1 <= {tmp1[7:0],tmp4[31:16]};
			x2 <= {tmp2[7:0],tmp5[23:16]};
			x3 <= {tmp3[7:0],tmp6[31:16]};
				end
		'd9,'d15,'d21,'d27,'d33,'d39: begin
			x1 <= tmp4[31:8];
			x2 <= {tmp5[31:24],tmp5[15:8]};
			x3 <= tmp6[31:8];
				end
		'd10,'d16,'d22,'d28,'d34,'d40: begin
			x1 <= tmp4[23:0];
			x2 <= {tmp5[23:16],tmp5[7:0]};
			x3 <= tmp6[23:0];
				end
		default:	begin
			x1 <= 'd0;
			x2 <= 'd0;
			x3 <= 'd0;
				end
	endcase
			
endmodule
