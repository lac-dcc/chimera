library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package filter_shared_package is

    -- Some range declarations
    subtype B_T is natural range 2 to 16;  -- Range of number of biquads
    subtype C_T is natural range 2 to 32;  -- Range of number of channels
    subtype P_T is natural range 1 to 32;  -- Range of pipeline depth or number of registers on path between input and output

    -- Modifiable Declarations
    constant B       : B_T     := 6;    -- Biquads
    constant C       : natural := 20;   -- Channels
    constant PM      : P_T     := 8;    -- FP Multiplier Pipeline depth reported by flopocco = number of inserted registers in combinational path
    constant PA      : P_T     := 11;   -- FP Adder Pipeline depth reported by flopocco = number of inserted registers in combinational path    
    constant RMS     : natural := 0;    -- Enable flag for RMS function.    0-disabled 1- enabled.
    constant MEAN    : natural := 0;    -- Enable flag for MEAN function.   0-disabled 1- enabled. 
    constant ENV     : natural := 0;    -- Enable flag for Envelope function.   0-disabled 1- enabled.
    constant ENV_MAC : natural := 15;   -- MAC id in which envelope function is to be enabled
    constant SETZ    : natural := 0;    -- Enable flag for Set Zero function.   0-disabled 1- enabled.

    -- Non-modifiable constant declarations
    constant MX          : natural := 3;      -- Number of MAC operations(or taps) on X values in a Biquad
    constant MY          : natural := 2;      -- Number of MAC operations(or taps) on Y values in a Biquad
    constant MB          : natural := MX+MY;  -- Number of MAC operations(or taps) on X & Y values in Biquad equation
    constant MC          : natural := MB*B;   -- Number of MAC operations per channel
    constant SINGLE      : natural := 32;     -- FP Precision: 32 - Single Precision, 64 - double precision
    constant DOUBLE      : natural := 64;
    constant XTRA_BITS   : natural := 2;      -- Two extra bits are prefixed to floating data words
    constant SINGLE_EXT  : natural := SINGLE+XTRA_BITS;  -- FP Precision: 32 + 2 - Single Extended Precision
    constant DOUBLE_EXT  : natural := DOUBLE+XTRA_BITS;  -- FP Precision: 64 + 2 - Double Extended Precision
    constant X_PAGES     : natural := MX;
    constant Y_PAGES     : natural := 2*B+1;
    constant COEFF_PAGES : natural := MC;
    constant ACC_PAGES   : natural := 1 + RMS + MEAN;
    constant MOD_ACC_PAGES: natural;

    -- Modifiable Declarations    
    constant PREC : natural := DOUBLE_EXT;  -- Use SINGLE_EXT for single precision and DOUBLE_EXT for double precision

    -- Address Types : natural(ceil(log2(real()))) [TODO: make a function]
    -- [(log2(some_value) + log2(channels) - 1) downto 0]
    subtype X_ADD_T is std_logic_vector(natural(ceil(log2(real(X_PAGES * C))))-1 downto 0);
    subtype Y_ADD_T is std_logic_vector(natural(ceil(log2(real(Y_PAGES * C))))-1 downto 0);
    subtype COEFF_ADD_T is std_logic_vector(natural(ceil(log2(real(COEFF_PAGES * C))))-1 downto 0);
    subtype ACC_ADD_T is std_logic_vector(natural(ceil(log2(real(ACC_PAGES * C))))-1 downto 0);

    -- Port Types
    subtype DATA_IO_PORT_T is std_logic_vector(PREC-1 downto 0);
    
    -- Function Declaration (optional)
    function acc_pgs(pages: natural) return natural;    
  
end filter_shared_package;

package body filter_shared_package is
    -- Function body
    function acc_pgs(pages: natural) return natural is
        -- Declaration(s)    
    begin 
        if( pages = 1) then
            return 2;
        else
            return pages;
        end if;
    end;

    -- Deferred constants
    constant MOD_ACC_PAGES:natural := acc_pgs(ACC_PAGES);
end filter_shared_package;