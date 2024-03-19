`timescale 1ns/1ps
/*
t2pb[31:0]  [28]cut marking [27]cut numb [26]aging marking [25]identity
p2pb_label[31:0]  [31]long pkt [30]no body pkt [29]cut marking  [28]cut number [27]aging [26:21]id addr [3:0]addr
*/
module packet_buffer(
clk,
reset,
p2pb_pkt_valid,
p2pb_pkt,
p2pb_label_valid,
p2pb_label,
pb2p_label_valid,
pb2p_label,
pb2p_enable,
pb2b_label_enable,
fragment_valid,
fragment_label,

t2pb_label_valid,
t2pb_label,
pb2t_pkt_valid,
pb2t_pkt,
pb2t_enable,

pkt_buffer_count
);

input clk;
input reset;
input p2pb_pkt_valid;
input [138:0] p2pb_pkt;
input p2pb_label_valid;
input [31:0]  p2pb_label;
output  pb2p_label_valid;
output  [31:0]  pb2p_label;
output  pb2p_enable;
input	pb2b_label_enable;
input fragment_valid;
input [31:0]  fragment_label;

input t2pb_label_valid;
input [31:0]  t2pb_label;
output  pb2t_pkt_valid;
output  [138:0]  pb2t_pkt;
output  pb2t_enable;

output	[7:0]	pkt_buffer_count;

reg  pb2p_label_valid;
reg  [31:0]  pb2p_label;
reg  pb2p_enable;
reg  pb2t_pkt_valid;
reg  [138:0]  pb2t_pkt;
reg  pb2t_enable;

//----------------fifo-----------------//
//--pkt--//
reg	fifo_pkt_rdreq;
wire  [138:0] fifo_pkt_q;
wire  [7:0] fifo_pkt_usedw;
wire	fifo_pkt_empty;
//--parser_label--//
reg	fifo_p_rdreq;
wire  [31:0] fifo_p_q;
wire  [3:0] fifo_p_usedw;
wire	fifo_p_empty;
//--transmit_label--//
reg	fifo_t_rdreq;
wire  [31:0] fifo_t_q;
wire  [3:0] fifo_t_usedw;
wire	fifo_t_empty;
//--addr--//
reg	fifo_addr_rdreq;
reg	fifo_addr_wrreq;
reg	[9:0]	fifo_addr_data;
wire  [9:0] fifo_addr_q;
wire  [3:0] fifo_addr_usedw;
wire	fifo_addr_empty;

reg	[9:0] fifo_addr_q_r;
//--aging--//
reg	fifo_aging_rdreq;
wire  [9:0] fifo_aging_q;
wire  [3:0] fifo_aging_usedw;
wire	fifo_aging_empty;
reg	fifo_aging_wrreq;
reg	[9:0]	fifo_aging_data;
//--recycle--//
reg	fifo_recycle_rdreq;
wire  [9:0] fifo_recycle_q;
wire  [3:0] fifo_recycle_usedw;
wire	fifo_recycle_empty;
reg	fifo_recycle_wrreq;
reg	[9:0]	fifo_recycle_data;


//---ram---//
reg [10:0] addr_a,addr_b;
reg wren_a,wren_b,rden_a,rden_b;
wire  [138:0] q_a,q_b;
reg   [138:0] data_a;


//---------reg--------//
reg [31:0]  label_p,label_t;
reg [9:0] addr_ini;
reg initial_finish;
reg flag_aging;

reg	[7:0]	pkt_buffer_count;

//---state---//
reg [3:0] store_state;
reg [3:0] read_state;
reg [3:0] addr_manage_state;

parameter   idle            = 4'd0,
            initialization  = 4'd1,
            read_p_fifo     = 4'd2,
				label_parser	 = 4'd4,
				assemble			 = 4'd5,
            read_addr_fifo  = 4'd6,
            wait_store_tail = 4'd7,
            discard         = 4'd8;
parameter   read_t_fifo     = 4'd2,
            wait_ram_1      = 4'd3,
            wait_ram_2      = 4'd4,
            read_ram        = 4'd5;
parameter	read_fifo_recycle	= 4'd3,
				read_fifo_aging	= 4'd4;

            

//-------------------store_state-------------------//
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
        fifo_p_rdreq <= 1'b0;
        fifo_pkt_rdreq <= 1'b0;
        fifo_addr_rdreq <= 1'b0;
        wren_a <= 1'b0;
		  rden_a <= 1'b0;
		  addr_a <= 11'b0;
        fifo_aging_wrreq <= 1'b0;
		  fifo_aging_data <= 10'b0;
		  fifo_addr_q_r	<=	10'b0;
		  pkt_buffer_count <= 8'b0;
        pb2p_label_valid <= 1'b0;
		pb2p_label <= 32'b0;
        store_state <= initialization;
      end
    else
      begin
        case(store_state)
          initialization:
          begin
              if(initial_finish == 1'b1)
                store_state <= idle;
          end
          idle:
          begin
              wren_a <= 1'b0;
              fifo_aging_wrreq <= 1'b0;
				  pb2p_label_valid <= 1'b0;
				  fifo_addr_rdreq <= 1'b0;//zq0906
              if((fifo_p_empty == 1'b0)&&(pb2b_label_enable == 1'b0))//zq0906
                begin
                    fifo_p_rdreq <= 1'b1;
					 store_state <= read_p_fifo;
                end
              else
                begin
					store_state <= idle;
					fifo_p_rdreq <= 1'b0;
                end
          end
          read_p_fifo:
          begin
              fifo_p_rdreq <= 1'b0;
              label_p <= fifo_p_q;         
              if(fifo_p_q[27] == 1'b1) //pkt aging 
                begin
                    fifo_aging_data <= fifo_p_q[9:0];
					fifo_aging_wrreq <= 1'b1;
                    store_state <= idle;
                end
              else
                begin
						if(fifo_p_q[30] == 1'b1)//no body pkt
							begin
								pb2p_label <= fifo_p_q;
								pb2p_label_valid <= 1'b1;	
								store_state <= idle;
							end
						else	store_state <= label_parser;
                end
          end
			 label_parser:
			 begin
				if(label_p[29:28]==2'b11)//no0
					begin
						if(fifo_pkt_empty == 1'b0)
							begin
								fifo_pkt_rdreq <= 1'b1;
									
								store_state <= assemble;
							end
						else 	store_state <= label_parser;
					end
				else
					begin
						if((fifo_pkt_empty == 1'b0) && (fifo_addr_empty == 1'b0))
							begin
								fifo_addr_rdreq <= 1'b1;//zq0906
								fifo_pkt_rdreq <= 1'b1;
								fifo_addr_q_r	<=	fifo_addr_q;
								store_state <= read_addr_fifo;
							end
						else	store_state <= label_parser;
					end
			 end
          assemble:
          begin
				 // addr_a <= {label_p[3:0],7'b0} + 11'd64;
				 addr_a <= {fifo_addr_q_r[3:0],7'b0} + 11'd64;//zq0906
              data_a <= fifo_pkt_q;
              wren_a <= 1'b1;
				//pb2p_label_valid <= 1'b1;//zq0907
             // pb2p_label <= {22'b0,label_p[9:0]};//zq0907
				 pb2p_label <= {22'b0,fifo_addr_q_r[9:0]};//zq0907 
				  pkt_buffer_count <= pkt_buffer_count +8'd1;
				  if(fifo_pkt_q[138:136] == 3'b110)
					begin
						fifo_pkt_rdreq <= 1'b0;
						pb2p_label_valid <= 1'b1;//zq0907
						store_state <= idle;
					end
				  else
					begin
						fifo_pkt_rdreq <= 1'b1;
						
						store_state <= wait_store_tail;
					end
          end
          read_addr_fifo:
          begin
              fifo_addr_rdreq <= 1'b0;
              addr_a <= {fifo_addr_q_r[3:0],7'b0};
              data_a <= fifo_pkt_q;
              wren_a <= 1'b1;
				  if(fifo_pkt_q[138:136] == 3'b110)
					begin
						fifo_pkt_rdreq <= 1'b0;
						pb2p_label_valid <= 1'b1;//zq0907
						store_state <= idle;
					end
				  else
					begin
						fifo_pkt_rdreq <= 1'b1;
						store_state <= wait_store_tail;
					end				  
            //  pb2p_label_valid <= 1'b1;
              pb2p_label <= {label_p[31:10],fifo_addr_q_r};
				  
				  pkt_buffer_count <= pkt_buffer_count +8'd1;
          end
          wait_store_tail:
          begin
              pb2p_label_valid <= 1'b0;
				  wren_a <= 1'b1;
              addr_a <= addr_a + 11'd1;
              if(fifo_pkt_q[138:136] == 3'b110)
                begin
                    fifo_pkt_rdreq <= 1'b0;
					pb2p_label_valid <= 1'b1;//zq0907
                    store_state <= idle;
                    if(label_p[29:28] == 2'b10)begin
						data_a <= {3'b100,fifo_pkt_q[135:0]};
						end
                    else begin 
						
						data_a <= fifo_pkt_q;
						end
                end
              else  data_a <= fifo_pkt_q;
          end
          discard:
          begin
              fifo_p_rdreq <= 1'b0;
              pb2p_label_valid <= 1'b0;
              if(fifo_pkt_q[138:136] == 3'b110)
                begin
                    fifo_pkt_rdreq <= 1'b0;
                    store_state <=idle;
                end
          end
          default:
          begin
              store_state <= idle;
          end
        endcase
      end
end
//-------------------read_state-------------------//
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
        
		  fifo_t_rdreq <= 1'b0;
		  wren_b <= 1'b0;
		  addr_b <= 11'b0;
        rden_b <= 1'b0;
        pb2t_enable <= 1'b1;
		  pb2t_pkt_valid <= 1'b0;
		  pb2t_pkt <= 139'b0;
		  fifo_recycle_wrreq <= 1'b0;
		  fifo_recycle_data <= 10'b0;
        
        read_state <= initialization;
      end
    else
      begin
        case(read_state)
          initialization:
          begin
              if(initial_finish == 1'b1)
					begin
						read_state <= idle;
					end
				  else	read_state <= initialization;
          end
          idle:
          begin
              pb2t_pkt_valid <= 1'b0;
              if(fifo_t_empty == 1'b0)
                begin
                    fifo_t_rdreq <= 1'b1;
                    read_state <= read_t_fifo;
                end
              else read_state <= idle;
          end
          read_t_fifo:
          begin
              fifo_t_rdreq <= 1'b0;
              label_t <= fifo_t_q;
				  
				  if(fifo_t_q[30] == 1'b0)
					begin
						rden_b <= 1'b1;
						case(fifo_t_q[29:28])
							2'b10:	addr_b <= {fifo_t_q[3:0],7'b0};
							2'b11:
								begin
									addr_b <= {fifo_t_q[3:0],7'b0} + 11'd64;
									fifo_recycle_data <= fifo_t_q[9:0];
									fifo_recycle_wrreq <= 1'b1;
								end
							default:
								begin
									addr_b <= {fifo_t_q[3:0],7'b0};
									fifo_recycle_data <= fifo_t_q[9:0];
									fifo_recycle_wrreq <= 1'b1;
								end
						endcase
						read_state <= wait_ram_1;
					end
				  else
					begin
						read_state <= idle;
					end
          end
          wait_ram_1:
          begin
              fifo_recycle_wrreq <= 1'b0;
				  
              addr_b <= addr_b + 11'd1;
              read_state <= wait_ram_2;
          end
          wait_ram_2:
          begin
              addr_b <= addr_b + 11'd1;
              read_state <= read_ram;
          end
          read_ram:
          begin
              addr_b <= addr_b + 11'd1;
              pb2t_pkt_valid <= 1'b1;  
              if(q_b[138:136]== 3'b110)
                begin
					 pb2t_pkt <= q_b;
                    read_state <= idle;
                    rden_b <= 1'b0;
                end
              else 
					begin
						if((label_t[29:28] == 2'b10) && (addr_b[5:0] == 6'd1))//1024
							begin
								pb2t_pkt <= {3'b110,q_b[135:0]};
								read_state <= idle;
								rden_b <= 1'b0;
							end
						else
							begin
								pb2t_pkt <= q_b;
								read_state <= read_ram;
							end
					end
          end
			 default:
			 begin
				read_state <= idle;
			 end
        endcase
      end
end
//---addr_manage_state--//
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
			initial_finish <= 1'b0;
			fifo_addr_wrreq <= 1'b0;
			fifo_addr_data <= 10'b0;
			fifo_aging_rdreq <= 1'b0;
			fifo_recycle_rdreq <= 1'b0;
			
			addr_ini <= 10'b0;
			addr_manage_state <= initialization;
      end
    else
      begin
          case(addr_manage_state)
				initialization:
				begin
					fifo_addr_wrreq <= 1'b1;
					fifo_addr_data <= addr_ini;
					addr_ini <= addr_ini+10'd1;
              
              if(addr_ini == 10'd15)
                begin
                    initial_finish <= 1'b1;
                    addr_manage_state <= idle;
                end
				end
				idle:
				begin
					fifo_addr_wrreq <= 1'b0;
					if(fifo_recycle_empty == 1'b0)
						begin
							fifo_recycle_rdreq <= 1'b1;
							addr_manage_state <= read_fifo_recycle;
						end
					else
						begin
							if(fifo_aging_empty == 1'b0)
								begin
									fifo_aging_rdreq <= 1'b1;
									addr_manage_state <= read_fifo_aging;
								end
							else	addr_manage_state <= idle;
						end
				end
				read_fifo_recycle:
				begin
					fifo_recycle_rdreq <= 1'b0;
					
					fifo_addr_data <= fifo_recycle_q;
					fifo_addr_wrreq <= 1'b1;
					
					addr_manage_state <= idle;
				end
				read_fifo_aging:
				begin
					fifo_recycle_rdreq <= 1'b0;
					
					fifo_addr_data <= fifo_aging_q;
					fifo_addr_wrreq <= 1'b1;
					
					addr_manage_state <= idle;
				end
				default:
				begin
					addr_ini <= 10'b0;
					initial_finish <= 1'b0;
					fifo_addr_wrreq <= 1'b0;
					
					addr_manage_state <= idle;
				end
			 endcase
      end
end

//-------------------enable_state-------------------//
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
        pb2p_enable <= 1'b0;
      end
    else
      begin
          if((fifo_addr_empty == 1'b0) && (initial_finish == 1'b1))
            begin
                pb2p_enable <= 1'b1;
            end
          else  pb2p_enable <= 1'b0;
      end
end



fifo_139_256 fifo_pkt(
.aclr(!reset),
.clock(clk),
.data(p2pb_pkt),
.rdreq(fifo_pkt_rdreq),
.wrreq(p2pb_pkt_valid),
.empty(fifo_pkt_empty),
.full(),
.q(fifo_pkt_q),
.usedw(fifo_pkt_usedw)
);

fifo_32_16 fifo_parser_label(
.aclr(!reset),
.clock(clk),
.data(p2pb_label),
.rdreq(fifo_p_rdreq),
.wrreq(p2pb_label_valid),
.empty(fifo_p_empty),
.full(),
.q(fifo_p_q),
.usedw(fifo_p_usedw)
);

fifo_32_16 fifo_transmit_label(
.aclr(!reset),
.clock(clk),
.data(t2pb_label),
.rdreq(fifo_t_rdreq),
.wrreq(t2pb_label_valid),
.empty(fifo_t_empty),
.full(),
.q(fifo_t_q),
.usedw(fifo_t_usedw)
);
//--addr_fifo--//
fifo_10_16 fifo_addr(
.aclr(!reset),
.clock(clk),
.data(fifo_addr_data),
.rdreq(fifo_addr_rdreq),
.wrreq(fifo_addr_wrreq),
.empty(fifo_addr_empty),
.full(),
.q(fifo_addr_q),
.usedw(fifo_addr_usedw)
);

ram_139_2048 ram_packt_payload(
.address_a(addr_a),
.address_b(addr_b),
.clock(clk),
.data_a(data_a),
.data_b(139'b0),
.rden_a(rden_a),
.rden_b(rden_b),
.wren_a(wren_a),
.wren_b(1'b0),
.q_a(q_a),
.q_b(q_b)
);


fifo_10_16 fifo_aging(
.aclr(!reset),
.clock(clk),
.data(label_p[9:0]),
.rdreq(fifo_aging_rdreq),
.wrreq(flag_aging),
.empty(fifo_aging_empty),
.full(),
.q(fifo_aging_q),
.usedw(fifo_aging_usedw)
);

fifo_10_16 fifo_recycle(
.aclr(!reset),
.clock(clk),
.data(fifo_recycle_data),
.rdreq(fifo_recycle_rdreq),
.wrreq(fifo_recycle_wrreq),
.empty(fifo_recycle_empty),
.full(),
.q(fifo_recycle_q),
.usedw(fifo_recycle_usedw)
);









endmodule



