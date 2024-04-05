
// PLL Ratio Calculator:
// http://ww1.microchip.com/downloads/en/DeviceDoc/AT91SAM_pll.htm 

`ifdef VGA_TB
    // Value don't matter...
    localparam idt_v   = 9'd2;
    localparam idt_r   = 7'd38;

    localparam h_active = 96;
    localparam h_fp = 2;
    localparam h_sync = 5;
    localparam h_bp = 4;
    localparam h_sync_positive = 1;

    localparam v_active = 64;
    localparam v_fp = 2;
    localparam v_sync = 3;
    localparam v_bp = 4;
    localparam v_sync_positive = 1;
`endif

`ifdef VGA640X480
    // Input: 100MHz
    // Output: 25.175
    // Ratio: 10/40
    // 100 * 2 * (2+8) / (38+2) / 2
    localparam idt_v   = 9'd2;
    localparam idt_r   = 7'd38;

    localparam h_active = 640;
    localparam h_fp = 16;
    localparam h_sync = 96;
    localparam h_bp = 48;
    localparam h_sync_positive = 0;

    localparam v_active = 480;
    localparam v_fp = 11;
    localparam v_sync = 2;
    localparam v_bp = 31;
    localparam v_sync_positive = 0;
`endif

`ifdef VGA800X600
    // Input: 100MHz
    // Output: 40MHz
    // Ratio: 20/50
    // 100 * 2 * (12+8) / (48+2) / 2
    localparam idt_v   = 9'd12;
    localparam idt_r   = 7'd48;

    localparam h_active = 800;
    localparam h_fp = 40;
    localparam h_sync = 128;
    localparam h_bp = 88;
    localparam h_sync_positive = 1;

    localparam v_active = 600;
    localparam v_fp = 1;
    localparam v_sync = 4;
    localparam v_bp = 23;
    localparam v_sync_positive = 1;
`endif


`ifdef VGA1024X768
    // Input: 100MHz
    // Output: 65MHz
    // Ratio: 13/20
    // 100 * 2 * (5+8) / (18+2) / 2
    localparam idt_v   = 9'd5;
    localparam idt_r   = 7'd18;

    localparam h_active = 1024;
    localparam h_fp = 24;
    localparam h_sync = 136;
    localparam h_bp = 160;
    localparam h_sync_positive = 0;

    localparam v_active = 768;
    localparam v_fp = 3;
    localparam v_sync = 6;
    localparam v_bp = 29;
    localparam v_sync_positive = 0;
`endif

`ifdef VGA1440X900
    // Input: 100MHz
    // Output: 106.47MHz
    // Ratio: 33/31
    // 100 * 2 * (25+8) / (29+2) / 2
    localparam idt_v   = 9'd25;
    localparam idt_r   = 7'd29;

    localparam h_active = 1440;
    localparam h_fp = 80;
    localparam h_sync = 152;
    localparam h_bp = 232;
    localparam h_sync_positive = 0;

    localparam v_active = 900;
    localparam v_fp = 1;
    localparam v_sync = 3;
    localparam v_bp = 28;
    localparam v_sync_positive = 1;
`endif

`ifdef VGA1680X1050
    // Input: 100MHz
    // Output: 147.14MHz
    // Ratio: 103/70
    // 100 * 2 * (95+8) / (68+2) / 2
    localparam idt_v   = 9'd95;
    localparam idt_r   = 7'd68;

    localparam h_active = 1680;
    localparam h_fp = 104;
    localparam h_sync = 184;
    localparam h_bp = 288;
    localparam h_sync_positive = 0;

    localparam v_active = 1050;
    localparam v_fp = 1;
    localparam v_sync = 3;
    localparam v_bp = 33;
    localparam v_sync_positive = 1;
`endif

`ifdef VGA1080P
    // Input: 100MHz
    // Output: 148.50MHz
    // Ratio: 49/33
    // 100 * 2 * (41+8) / (31+2) / 2
    localparam idt_v   = 9'd41;
    localparam idt_r   = 7'd31;

    localparam h_active = 1920;
    localparam h_fp = 88;
    localparam h_sync = 44;
    localparam h_bp = 148;
    localparam h_sync_positive = 1;

    localparam v_active = 1080;
    localparam v_fp = 4;
    localparam v_sync = 5;
    localparam v_bp = 36;
    localparam v_sync_positive = 1;
`endif

    localparam h_blank = h_fp + h_sync + h_bp;
    localparam h_total = h_blank + h_active;

    localparam v_blank = v_fp + v_sync + v_bp;
    localparam v_total = v_active + v_blank;

