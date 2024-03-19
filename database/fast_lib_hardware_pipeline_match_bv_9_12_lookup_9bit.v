
`timescale 1ns/1ps


module lookup_9bit(
clk,
reset,
set_valid,
set_data,
read_valid,
read_addr,
data_out_valid,
data_out,

key_valid,
key,
//bv_valid,
bv,
stage_enable

);

input           clk;
input           reset;
input           set_valid;
input [44:0]    set_data;
input           read_valid;
input [8:0]     read_addr;
output          data_out_valid;
output[35:0]    data_out;

input           key_valid;
input [8:0]     key;
//output          bv_valid;
output[35:0]    bv;

output          stage_enable;





reg             data_out_valid;
reg [35:0]      data_out;
//reg             bv_valid;
wire [35:0]     bv;

reg             stage_enable;


//--reg--//

//----ram---//a:lookup;       b:set;
reg [8:0] address_b;
reg rden_b;
reg wren_b;
reg [35:0]   data_b;
wire  [35:0]   q_b;




//-------state----//
reg [3:0] set_state;

parameter     idle    = 4'd0,
              read_wait_1 = 4'd1,
              read_wait_2 = 4'd2,
              read_ram    = 4'd3;
              
             

//-----------------------state--------------------------//
//------search-----//
//--input--//
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
			    stage_enable <= 1'b0;
      end
    else
      begin
          if(key_valid == 1'b1)
            begin
                stage_enable <= 1'b1;
            end
          else  stage_enable <= 1'b0;
      end
end


//---set---//
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
			    set_state <= idle;
			     data_out <= 36'b0;
			    data_out_valid <= 1'b0;
				address_b <= 9'b0;
				rden_b <= 1'b0;
				data_b <= 36'b0;
      end
    else
      begin
        case(set_state)
          idle:
          begin
              data_out_valid <= 1'b0;
              if(set_valid == 1'b1)
                begin
                    set_state <= idle;
                    
                    wren_b <= 1'b1;
                    address_b <= set_data[44:36];
                    data_b <= set_data[35:0];
                end
              else if(read_valid == 1'b1)
                begin
                    set_state <= read_wait_1;
                    
                    wren_b <= 1'b0;
                    rden_b <= 1'b1;
                    address_b <= read_addr;
                end
              else
                begin
                    wren_b <= 1'b0;
                end
          end
          read_wait_1:
          begin
              rden_b <= 1'b0;
              
              set_state <= read_wait_2;
          end
          read_wait_2:
          begin
              set_state <= read_ram;
          end
          read_ram:
          begin
              data_out_valid <= 1'b1;
              data_out <= q_b;
              
              set_state <= idle;
          end
          
          default:
          begin
              set_state <= idle;
          end
        endcase
      end
end


ram_36_512 ram_1(
.address_a(key),
.address_b(address_b),
.clock(clk),
.data_a(36'b0),
.data_b(data_b),
.rden_a(key_valid),
.rden_b(rden_b),
.wren_a(1'b0),
.wren_b(wren_b),
.q_a(bv),
.q_b(q_b)

);








endmodule


