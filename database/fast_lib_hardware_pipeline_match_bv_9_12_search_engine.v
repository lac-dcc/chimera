`timescale 1ns/1ps

module search_engine(
clk,
reset,

key_valid,
key,
bv_valid,
bv,


localbus_cs_n,
localbus_rd_wr,
localbus_data,
localbus_ale,
localbus_ack_n,
localbus_data_out

);


input       clk;
input       reset;
input       key_valid;
input [26:0]key;
output      bv_valid;
output[35:0]bv;

input           localbus_cs_n;
input           localbus_rd_wr;
input[31:0]     localbus_data;
input           localbus_ale;
output          localbus_ack_n;
output[31:0]    localbus_data_out;

reg localbus_ack_n;
reg [31:0]  localbus_data_out;

wire          bv_valid;
wire[35:0]    bv;


reg           set_valid_1,set_valid_2,set_valid_3;
reg           read_valid_1,read_valid_2,read_valid_3;
//reg [8:0]     read_addr_1,read_addr_2,read_addr_3;
wire          data_out_valid_1,data_out_valid_2,data_out_valid_3;
wire[35:0]    data_out_1,data_out_2,data_out_3;
              
wire[35:0]    bv_1,bv_2,bv_3;

wire          stage_enable_1,stage_enable_2,stage_enable_3;


//---state----//
reg [3:0] set_state;


parameter         idle          = 4'd0,
                  ram_set       = 4'd1,
                  ram_read      = 4'd2,
                  wait_read     = 4'd3,
                  wait_back     = 4'd4;
                  
                  

//--------------reg--------------//
//--search--//


//--set--//
reg [31:0]  localbus_addr;
reg [44:0]  set_data;//addr_9+36;
reg [12:0]  set_data_1;//addr_9+localbus[31]_vald+localbus[2:0];  1st;
reg [35:0]  data_out;

reg [8:0]   read_addr;




//-----------------------search_state-----------------//



//-----------------------set_state---------------//
always @ (posedge clk or negedge reset)
begin
    if(!reset)
      begin
			    set_state <= idle;
			    
			    set_valid_1 <= 1'b0;set_valid_2 <= 1'b0;set_valid_3 <= 1'b0;
			    read_valid_1<= 1'b0;read_valid_2<= 1'b0;read_valid_3<= 1'b0;
			    localbus_addr <= 32'b0;
			    data_out <= 36'd0;
				set_data	<=	45'b0;
				set_data_1	<=	13'b0;
				read_addr <= 9'b0;
			    localbus_data_out <= 32'b0;
			    localbus_ack_n <= 1'b1;
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
                        1'd0:   set_data_1   <= {localbus_addr[11:3],localbus_data[31],localbus_data[2:0]};//????zq0825
                        1'd1:   
                        begin
                            set_data     <= {set_data_1,localbus_data};
                            case(localbus_addr[13:12])
                              3'd0: set_valid_1 <= 1'b1;
                              3'd1: set_valid_2 <= 1'b1;
                              3'd2: set_valid_3 <= 1'b1;
                              3'd3: set_valid_3 <= 1'b0;
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
                            
                            read_addr <= localbus_addr[11:3];
                            case(localbus_addr[13:12])
                              3'd0: read_valid_1 <= 1'b1;
                              3'd1: read_valid_2 <= 1'b1;
                              3'd2: read_valid_3 <= 1'b1;
                              3'd3: read_valid_3 <= 1'b1;
                            endcase
                        end
                        1'b1:   localbus_data_out <= data_out[31:0];
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
                read_valid_1 <= 1'b0;read_valid_2 <= 1'b0;read_valid_3 <= 1'b0;
                if((data_out_valid_1 == 1'b1) || (data_out_valid_2 == 1'b1) || (data_out_valid_3 == 1'b1))
                begin
                    case({data_out_valid_1,data_out_valid_2,data_out_valid_3})
                      3'd4:
                      begin
                          data_out <= data_out_1;
                          localbus_data_out <= {data_out_1[35],28'b0,data_out_1[34:32]};
                      end
                      3'd2:
                      begin
                          data_out <= data_out_2;
                          localbus_data_out <= {data_out_2[35],28'b0,data_out_2[34:32]};
                      end
                      3'd1:
                      begin
                          data_out <= data_out_3;
                          localbus_data_out <= {data_out_3[35],28'b0,data_out_3[34:32]};
                      end
                      
                      default:
                      begin
                          data_out <= 36'b0;
                          localbus_data_out <= 32'b0;
                      end
                    endcase
                    
                    localbus_ack_n <= 1'b0;
                    set_state <= wait_back;
                end
            end
            
            wait_back:
            begin
                set_valid_1 <= 1'b0;set_valid_2 <= 1'b0;set_valid_3 <= 1'b0;
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

































  
//-----------------stage_1------------------//
lookup_9bit stage_1_1(
.clk(clk),
.reset(reset),
.set_valid(set_valid_1),
.set_data(set_data),
.read_valid(read_valid_1),
.read_addr(read_addr),
.data_out_valid(data_out_valid_1),
.data_out(data_out_1),

.key_valid(key_valid),
.key(key[26:18]),
//.bv_valid(),
.bv(bv_1),
.stage_enable(stage_enable_1)
);

//--stage_1_2--//
lookup_9bit stage_1_2(
.clk(clk),
.reset(reset),
.set_valid(set_valid_2),
.set_data(set_data),
.read_valid(read_valid_2),
.read_addr(read_addr),
.data_out_valid(data_out_valid_2),
.data_out(data_out_2),

.key_valid(key_valid),
.key(key[17:9]),
//.bv_valid(),
.bv(bv_2),
.stage_enable()
);


//--stage_1_3--//
lookup_9bit stage_1_3(
.clk(clk),
.reset(reset),
.set_valid(set_valid_3),
.set_data(set_data),
.read_valid(read_valid_3),
.read_addr(read_addr),
.data_out_valid(data_out_valid_3),
.data_out(data_out_3),

.key_valid(key_valid),
.key(key[8:0]),
//.bv_valid(),
.bv(bv_3),
.stage_enable()
);


//--stage_2--//
hold1clk stage_2(
.clk(clk),
.reset(reset),
.stage_enable_in(stage_enable_1),
.stage_enable_out(stage_enable_2)
);


//--stage_3--//
bv_and stage_3(
.clk(clk),
.reset(reset),
.stage_enable_in(stage_enable_2),
.stage_enable_out(stage_enable_3),

.bv_1(bv_1),
.bv_2(bv_2),
.bv_3(bv_3),
.bv_valid(bv_valid),
.bv(bv)
);



endmodule
