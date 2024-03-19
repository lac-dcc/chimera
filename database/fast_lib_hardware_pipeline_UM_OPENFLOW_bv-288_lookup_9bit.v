
`timescale 1ns/1ps


module lookup_bit(
clk,
reset,
set_valid,
set_data,
read_valid,
addr,
data_out_valid,
data_out,

key_valid,
key,
bv_valid,
bv

);

input           clk;
input           reset;
input           set_valid;
input [35:0]    set_data;
input           read_valid;
input [8:0]     addr;
output  reg     data_out_valid;
output  reg [35:0]    data_out;

input           key_valid;
input [8:0]     key;
output  wire           bv_valid;
output  wire [35:0]    bv;




wire  stage_enable;
//----ram---//a:lookup;       b:set;
reg [8:0] address_b;
reg rden_b;
reg wren_a,wren_b;
reg [35:0]   data_b;
wire  [35:0]   q_a,q_b;




//-------state----//
reg [3:0] set_state;


parameter     idle      = 4'd0,
              read_wait = 4'd1,
              read_ram  = 4'd3;
              
             

//-----------------------state--------------------------//

//---set---//
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
			    set_state <= idle;
			    
			    data_out_valid <= 1'b0;
      end
    else
      begin
        case(set_state)
          idle:
          begin
              data_out_valid <= 1'b0;
              if(read_valid == 1'b1)
                begin
                    set_state <= read_wait;                    
                end
          end
          read_wait:
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
.address_b(addr),
.clock(clk),
.data_a(36'b0),
.data_b(set_data),
.rden_a(key_valid),
.rden_b(read_valid),
.wren_a(1'b0),
.wren_b(set_valid),
.q_a(bv),
.q_b(q_b)

);

hold1clk  hold1clk_1(
.clk(clk),
.reset(reset),
.stage_enable_in(key_valid),
.stage_enable_out(stage_enable)
);
hold1clk  hold1clk_2(
.clk(clk),
.reset(reset),
.stage_enable_in(stage_enable),
.stage_enable_out(bv_valid)
);







endmodule


