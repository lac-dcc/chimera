
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    sd_read 
//////////////////////////////////////////////////////////////////////////////////
module sd_read(   input SD_clk,
						output reg SD_cs,
						output reg SD_datain,
						input  SD_dataout,
						
						output reg [7:0]mydata_o,
						output reg myvalid_o,
						output reg data_come,
						
						input init,
						
						output reg [3:0] mystate,
						output reg read_o
						
						
    );
	 

reg [7:0] rx;
reg en;
reg rx_valid;
reg [5:0] aa;	 
reg [21:0] cnt;

reg [31:0] sec;            //SD��sec��ַ

reg myen;

reg read_finish;
reg read_start;

reg [7:0] mydata;

reg [1:0] read_step;
reg [9:0] read_cnt;

reg [15:0] delay_cnt;

reg [47:0] CMD17; //CMD17���ֽ�����

reg [2:0] cnta,cntb;

reg [11:0] sec_size;

parameter idle=4'd0;
parameter read=4'd1;
parameter read_wait=4'd2;
parameter read_data=4'd3;
parameter read_done=4'd4;

parameter SEC_LEN=12'd3072;    //total sector size of one picture : 1024 * 768 * 2 /512

parameter SADDR=32'd16448;     //ͼƬ��SD������ʼsector��ַ,��һ��Ϊ16448,�ڶ���Ϊ19520
	 
always @(posedge SD_clk)
begin
	rx[0]<=SD_dataout;
	rx[7:1]<=rx[6:0];
end

//����һ��block�������Ӧ������
always @(posedge SD_clk)
begin
	if(!SD_dataout&&!en)begin rx_valid<=1'b0; aa<=1;en<=1'b1;end      //�ȴ�SD_dataoutΪ��,SD_dataoutΪ��,��ʼ��������
   else if(en)	begin 
		if(aa<7) begin
			aa<=aa+1'b1; 
			rx_valid<=1'b0;
		end
		else begin
			aa<=0;
			en<=1'b0;
			rx_valid<=1'b1;             //�������8bit��,rx_valid�źſ�ʼ��Ч
		end
	end
	else begin en<=1'b0;aa<=0;rx_valid<=1'b0;end
end

//block SD������
always @(negedge SD_clk)
if(!init)
	begin
		mystate<=idle;
		CMD17<={8'h51,8'h00,8'h00,8'h00,8'h00,8'hff};
		read_start<=1'b0;
		read_o<=1'b0;
		sec<=SADDR;
		sec_size<=0;
		SD_cs<=1'b1;
		SD_datain<=1'b1;		
	end
else
	begin
	case(mystate)
		idle:	begin
				read_start<=1'b0;
				SD_cs<=1'b1;
				SD_datain<=1'b1;
				cnt<=22'd0;	
				if((read_o==1'b0) && (delay_cnt==10000))        //�����û�а�SD����ͼƬ��ŵ�SDRAM��
					begin
						mystate<=read;
						read_o<=1'b0;
						CMD17<={8'h51,sec[31:24],sec[23:16],sec[15:8],sec[7:0],8'hff};
					end
				else begin
				   mystate<=idle;
					delay_cnt<=delay_cnt+1'b1;	
	         end	
		end
		read: begin                    //����CMD17���� (single Block Read)	
			   read_start<=1'b0;
			   if(CMD17!=48'd0) begin
					SD_cs<=1'b0;
					SD_datain<=CMD17[47];
					CMD17<={CMD17[46:0],1'b0};     //��λ���
					myen<=1'b0;
					cnt<=22'd0;									
				end
				else begin 
				   if(rx_valid) begin         //�ȴ�Ӧ���ź�			
						cnt<=0;
						mystate<=read_wait;
					end
				end
		end
		read_wait: begin             //�ȴ��������ݵ���ʼλ,�͵�ƽ
		     if(read_finish)  begin
			     mystate<=read_done;
				  read_start<=1'b0;
			  end
			  else
			     read_start<=1'b1;				  
		end	
		read_done: begin               //��512���ֽ����
			  read_start<=1'b0;
				if(cnt<22'd15) begin
					 SD_cs<=1'b1;
					 SD_datain<=1'b1;
					 cnt<=cnt+1'b1;
				 end
				 else begin 
				    cnt<=0;
					 if (sec_size<SEC_LEN) begin            //�������ͼ��δ���� 
 					    read_o<=1'b0;
                   sec <= sec + 1'b1;
						 sec_size <= sec_size +1'b1;
						 mystate<=idle;
					 end	 
					 else	begin	 
					    read_o<=1'b1;
						 mystate<=idle;
					 end	 

				end
		end
		default:mystate<=0;
		endcase		
	end

//����SD����	
always @(posedge SD_clk)
begin
	if(!init)begin
		myvalid_o<=1'b0;
		mydata_o<=0;
		mydata<=0;
		read_step<=2'b00;
		read_finish<=1'b0;
		data_come<=1'b0;
	end
	else begin
		case (read_step) 
		2'b00: begin
			cntb<=0;
			read_cnt<=0;
			read_finish<=1'b0;
		   if((read_start==1'b1)&(!SD_dataout)) begin     //���յ����ݿ�ʼ�ź�
				  read_step<=2'b01;
				  data_come<=1'b1;
			end	  
			else 
				  read_step<=2'b00;
		end
		2'b01: begin             //����512��bytes
			if(read_cnt<512)	begin
			   if(cntb<7)	begin
				      myvalid_o<=1'b0;
					   mydata<={mydata[6:0],SD_dataout};
					   cntb<=cntb+1'b1;
						data_come<=1'b0;
				 end
				 else begin
						myvalid_o<=1'b1;            //һ��byte������Ч
						mydata_o<={mydata[6:0],SD_dataout};
						cntb<=0;
						read_cnt<=read_cnt+1'b1;
						data_come<=1'b0;
				  end
			 end
			 else begin 
				   read_finish<=1'b1;
					read_step<=2'b00;
					myvalid_o<=1'b0;
					data_come<=1'b0;
			 end
		end
		default:read_step<=2'b00;
		endcase	
    end
end	 

endmodule
