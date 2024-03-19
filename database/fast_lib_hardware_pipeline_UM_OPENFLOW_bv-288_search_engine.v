`timescale 1ns/1ps

module search_engine(
clk,
reset,

key_in_valid,
key_in,
bv_out_valid,
bv_out,


localbus_cs_n,
localbus_rd_wr,
localbus_data,
localbus_ale,
localbus_ack_n,
localbus_data_out

);


input                   clk;
input                   reset;
input                   key_in_valid;
input         [71:0]    key_in;
output  wire            bv_out_valid;
output  wire  [35:0]    bv_out;

input           localbus_cs_n;
input           localbus_rd_wr;
input [31:0]    localbus_data;
input           localbus_ale;
output  reg     localbus_ack_n;
output  reg [31:0]  localbus_data_out;


reg           set_valid[0:7];
reg           read_valid[0:7];
reg   [8:0]   addr;
wire          data_out_valid[0:7];
wire  [35:0]  data_out[0:7];

wire          stage_enable[0:1];
              
wire          bv_valid_temp[0:7];
wire  [35:0]  bv_temp[0:7];


//---state----//
reg [3:0] set_state;


parameter         idle          = 4'd0,
                  ram_set       = 4'd1,
                  ram_read      = 4'd2,
                  wait_read     = 4'd3,
                  wait_back     = 4'd4;
                  
                  

//--------------reg--------------//



//--set--//
reg [31:0]  localbus_addr;
reg [35:0]  set_data_temp;
wire[35:0]  data_out_temp;
wire        data_out_valid_temp;
reg [35:0]  data_out_temp_reg;

assign    data_out_valid_temp = (data_out_valid[0] == 1'b1)? 1'b1:
                                (data_out_valid[1] == 1'b1)? 1'b1:
                                (data_out_valid[2] == 1'b1)? 1'b1:
                                (data_out_valid[3] == 1'b1)? 1'b1:
                                (data_out_valid[4] == 1'b1)? 1'b1:
                                (data_out_valid[5] == 1'b1)? 1'b1:
                                (data_out_valid[6] == 1'b1)? 1'b1:
                                (data_out_valid[7] == 1'b1)? 1'b1:
                                1'b0;
                                
assign    data_out_temp = (data_out_valid[0] == 1'b1)? data_out[0]:
                          (data_out_valid[1] == 1'b1)? data_out[1]:
                          (data_out_valid[2] == 1'b1)? data_out[2]:
                          (data_out_valid[3] == 1'b1)? data_out[3]:
                          (data_out_valid[4] == 1'b1)? data_out[4]:
                          (data_out_valid[5] == 1'b1)? data_out[5]:
                          (data_out_valid[6] == 1'b1)? data_out[6]:
                          (data_out_valid[7] == 1'b1)? data_out[7]:
                          36'b0;
                          





//-----------------------set_state---------------//
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
			    set_state <= idle;
			    
			    set_valid[0] <= 1'b0;set_valid[1] <= 1'b0;set_valid[2] <= 1'b0;
			    set_valid[3] <= 1'b0;set_valid[4] <= 1'b0;set_valid[5] <= 1'b0;
			    set_valid[6] <= 1'b0;set_valid[7] <= 1'b0;
			    read_valid[0]<= 1'b0;read_valid[1]<= 1'b0;read_valid[2]<= 1'b0;
			    read_valid[3]<= 1'b0;read_valid[4]<= 1'b0;read_valid[5]<= 1'b0;
			    read_valid[6]<= 1'b0;read_valid[7]<= 1'b0;
			    
			    set_data_temp <= 36'b0;
			    
			    localbus_ack_n <= 1'b1;
			    localbus_data_out <= 32'b0;
      end
    else
      begin
          case(set_state)
            idle:
            begin
                if(localbus_ale == 1'b1)
                  begin
                      localbus_addr <= localbus_data;
                      if(localbus_rd_wr == 1'b0)
                        begin
                            
                            set_state <= ram_set;
                        end
                      else
                        begin
                            set_state <= ram_read;
                        end
                  end
            end
            ram_set:
            begin
                if(localbus_cs_n == 1'b0)
                  begin
                      case(localbus_addr[0])
                        1'd0:   set_data_temp[35:32]   <= localbus_data[3:0];
                        1'd1:   
                        begin
                            set_data_temp[31:0]     <= localbus_data;
                            addr <= localbus_addr[11:3];
                            case(localbus_addr[14:12])
                              3'd0: set_valid[0] <= 1'b1;
                              3'd1: set_valid[1] <= 1'b1;
                              3'd2: set_valid[2] <= 1'b1;
                              3'd3: set_valid[3] <= 1'b1;
                              3'd4: set_valid[4] <= 1'b1;
                              3'd5: set_valid[5] <= 1'b1;
                              3'd6: set_valid[6] <= 1'b1;
                              3'd7: set_valid[7] <= 1'b1;
                            endcase
                        end
                      endcase
                      set_state <= wait_back;
                      
                      localbus_ack_n <= 1'b0;
                      
                  end
            end
            ram_read:
            begin
              if(localbus_cs_n == 1'b0)
                begin
                    case(localbus_addr[0])
                        1'b0:
                        begin
                            
                            addr <= localbus_addr[11:3];
                            case(localbus_addr[14:12])
                              3'd0: read_valid[0] <= 1'b1;
                              3'd1: read_valid[1] <= 1'b1;
                              3'd2: read_valid[2] <= 1'b1;
                              3'd3: read_valid[3] <= 1'b1;
                              3'd4: read_valid[4] <= 1'b1;
                              3'd5: read_valid[5] <= 1'b1;
                              3'd6: read_valid[6] <= 1'b1;
                              3'd7: read_valid[7] <= 1'b1;
                            endcase
                        end
                        1'b1:   localbus_data_out <= data_out_temp_reg[31:0];
                    endcase
                if(localbus_addr[0] == 1'b0)
                  begin
                      set_state <= wait_read;
                  end
                else
                  begin
                      set_state <= wait_back;
                      
                      localbus_ack_n <= 1'b0;
                  end
              end
                            
            end
            
            wait_read:
            begin
                read_valid[0]<= 1'b0;read_valid[1]<= 1'b0;read_valid[2]<= 1'b0;
                read_valid[3]<= 1'b0;read_valid[4]<= 1'b0;read_valid[5]<= 1'b0;
                read_valid[6]<= 1'b0;read_valid[7]<= 1'b0;
                if(data_out_valid_temp == 1'b1)begin
                    localbus_data_out <={28'b0,data_out_temp[35:32]};
                    data_out_temp_reg <= data_out_temp;
                    localbus_ack_n <= 1'b0;
                    set_state <= wait_back;
                end
            end
            
            wait_back:
            begin
                set_valid[0] <= 1'b0;set_valid[1] <= 1'b0;set_valid[2] <= 1'b0;
                set_valid[3] <= 1'b0;set_valid[4] <= 1'b0;set_valid[5] <= 1'b0;
                set_valid[6] <= 1'b0;set_valid[7] <= 1'b0;
                if(localbus_cs_n == 1'b1)
                  begin
                      localbus_ack_n <= 1'b1;
                      set_state <= idle;
                  end
            end
            default:
            begin
                set_state <= idle;
            end
          endcase
      end
end

generate
    genvar i;
    for(i=0; i<8; i= i+1) begin : lookup_bit
      lookup_bit lb(
      .clk(clk),
		  .reset(reset),
		  .set_valid(set_valid[i]),
		  .set_data(set_data_temp[35:0]),
		  .read_valid(read_valid[i]),
		  .addr(addr),
		  .data_out_valid(data_out_valid[i]),
		  .data_out(data_out[i]),

		  .key_valid(key_in_valid),
		  .key(key_in[((i+1)*9-1):i*9]),
		  .bv_valid(bv_valid_temp[i]),
		  .bv(bv_temp[i])
      );
    end
endgenerate




bv_and_8 bv_and_8(
.clk(clk),
.reset(reset),
.bv_in_valid(bv_valid_temp[0]),

.bv_1(bv_temp[0]),
.bv_2(bv_temp[1]),
.bv_3(bv_temp[2]),
.bv_4(bv_temp[3]),
.bv_5(bv_temp[4]),
.bv_6(bv_temp[5]),
.bv_7(bv_temp[6]),
.bv_8(bv_temp[7]),

.bv_out_valid(bv_out_valid),
.bv_out(bv_out)
);



endmodule
