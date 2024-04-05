module boot(
    clockgb, resetn,
    address, indata, outdata, load, store,
    boot_active
);

input clockgb;
input resetn;

input [15:0] address;
input [7:0] indata;
output [7:0] outdata;
input load;
input store;

output boot_active = boot_load[1];


wire [15:0] boot_address;
wire [7:0] boot_outdata;
wire boot_preload;

bootrom bootrom (
    boot_address[7:0],
	clockgb,
	boot_outdata
);

mmap #(16'h0000, 16'h00ff) rom_mmap(
    clockgb, resetn,
    address, indata, outdata, load, store,
    boot_address,, boot_outdata, boot_preload
);


reg boot_enabled;
reg boot_load [2];

always @(posedge clockgb or negedge resetn) begin
    if (!resetn) begin
        boot_enabled <= 1'b1;
        boot_load[0] <= 0;
        boot_load[0] <= 0;
    end else begin
        boot_load[0] <= boot_enabled && boot_preload;
        boot_load[1] <= boot_load[0];
        
        if (disable_store) begin
            boot_enabled <= 1'b0;
        end
    end
end


wire disable_store;

rrmmap #(16'hff50) disable_mmap(
    clockgb, resetn,
    address, indata,, load, store,,,,, 
    disable_store
);

endmodule
