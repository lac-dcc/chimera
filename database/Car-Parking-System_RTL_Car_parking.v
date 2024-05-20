// This program was cloned from: https://github.com/Nilesh002/Car-Parking-System
// License: MIT License

module car_parking(vehicle_no,gate,clk,vehicle_present,password,password_entered,reset,password_check,car_parked);
input [3:0] password;
input [31:0]vehicle_no;
input vehicle_present;
input password_entered;
input clk;
input reset;
output reg gate;
output reg password_check;
output reg car_parked;

reg [3:0]wrong_password_count=0;
reg vehicle_denied;
reg [31:0] Mem[0:63];
reg [5:0] mem_pointer=0;
reg vehicle_found=0;
reg [1:0]state, n_state;
reg s1,s2;

reg malpractice;
integer i;
parameter IDLE=2'b00, SENSOR1=2'b01, CHECK=2'b10, GO=2'b11;
parameter ORIGINAL_PASSWORD=4'b0110;

always @(posedge clk or posedge reset)
begin
if(reset)
begin
state <= IDLE;
mem_pointer <= 0;
vehicle_denied <=0;
end
else
state <= n_state;
end



always @(posedge clk)
begin
for(i=0; i<64; i=i+1)
begin
if(Mem[i] == vehicle_no)
begin
vehicle_denied <= 1'b1;
end
end

end




always @(posedge clk)
begin
case(state)

IDLE: begin
 password_check <= 1'b0;
  car_parked <= 1'b0;
if(vehicle_present && ~vehicle_denied) 
begin
n_state <= SENSOR1;
s1 <= 1'b1;
s2 <= 1'b0;
gate <= 1'b0;
malpractice<= 0;
end

else
begin
n_state <= IDLE;
s1 <= 1'b0;
s2 <= 1'b0;
gate <= 1'b0;
malpractice<= 0;
end
end

SENSOR1: begin
  car_parked <= 1'b0;
  password_check <= 1'b0;
  malpractice<= 0;
  if(password_entered == 1'b1 && s1 == 1'b1)
  begin
  vehicle_denied <= 0;
  n_state <= CHECK;
  s1 <= 1'b1;
  s2 <= 1'b0;
  gate <= 1'b0;
  end
 else
  n_state <= IDLE;
end

CHECK: begin
vehicle_denied <= 0;
if(password == ORIGINAL_PASSWORD)
begin
password_check <= 1'b1;
 car_parked <= 1'b0;
s1 <= 1'b0;
s2 <= 1'b1;
n_state <= GO;
#10 gate <= 1'b1;
end
else
 begin
                // Increment wrong password count and store vehicle number if count exceeds threshold
                if (wrong_password_count < 3) 
                begin
                   wrong_password_count <= wrong_password_count + 1;
                   n_state <= SENSOR1;  
                end
                else
                begin
                   mem_pointer <= mem_pointer+1;
                   Mem[mem_pointer] <= vehicle_no;
               //    n_state <= IDLE;
                   wrong_password_count <= 4'd0;
                   malpractice<= 1;
                end
                
            end
end

GO:    begin
vehicle_denied <= 0;
 password_check <= 1'b0;
if(s2 == 1'b1)
begin
 s1 <= 1'b0;
 s2 <= 1'b0;
 car_parked <= 1'b1;
 gate <= 1'b0;
 n_state <= IDLE;
end
       end

default: begin
          vehicle_denied <=0;
          n_state <= IDLE;          
          car_parked <= 1'b0;
          password_check <= 1'b0;
         end
endcase

end

endmodule
