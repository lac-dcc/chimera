-- (C) 2001-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions and other 
-- software and tools, and its AMPP partner logic functions, and any output 
-- files any of the foregoing (including device programming or simulation 
-- files), and any associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License Subscription 
-- Agreement, Altera MegaCore Function License Agreement, or other applicable 
-- license agreement, including, without limitation, that your use is for the 
-- sole purpose of programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the applicable 
-- agreement for further details.


-------------------------------------------------------------------------
-- Implements a radix-4 non-performing brute-force iterative division. --
-- Takes 14 cycles to drive the quotient on "result" output after "start"
-- input is driven to 1.
-------------------------------------------------------------------------

LIBRARY IEEE;                                    
USE IEEE.STD_LOGIC_1164.all;                        
USE IEEE.numeric_std.all;                            

ENTITY FPDiv IS  
    port(
        clk      : in  std_logic;
        clk_en   : in  std_logic; -- Connected to clk_en of all registers
        reset    : in  std_logic; -- Connected to async reset of all registers
        start    : in  std_logic; -- Set to '1' for 1 cycle when starting
        dataa    : in  std_logic_vector(31 downto 0); -- Numerator. Only valid when start=1
        datab    : in  std_logic_vector(31 downto 0); -- Denominator. Only valid when start=1
        result   : out std_logic_vector(31 downto 0)  -- Quotient. Driven from logic.
   );
END FPDiv;
-------------------------------------------------------

architecture beh of FPDiv is
    -- Fields in a single-precision floating-point value.
    constant FLOAT_SZ : integer := 32;
    constant FLOAT_LSB : integer := 0;
    constant FLOAT_MSB : integer := FLOAT_LSB + FLOAT_SZ - 1;
    subtype FLOAT_RANGE is natural range FLOAT_MSB downto FLOAT_LSB;
    constant FLOAT_SIGN_LSB : integer := 31;
    constant FLOAT_EXP_MSB : integer := 30;
    constant FLOAT_EXP_LSB : integer := 23;
    constant FLOAT_EXP_SZ : integer := FLOAT_EXP_MSB - FLOAT_EXP_LSB + 1;
    subtype FLOAT_EXP_RANGE is natural range FLOAT_EXP_MSB downto FLOAT_EXP_LSB;
    constant FLOAT_FRAC_MSB : integer := 22;
    constant FLOAT_FRAC_LSB : integer := 0;
    constant FLOAT_FRAC_SZ : integer := FLOAT_FRAC_MSB - FLOAT_FRAC_LSB + 1;
    subtype FLOAT_FRAC_RANGE is natural range FLOAT_FRAC_MSB downto FLOAT_FRAC_LSB;

    -- Fields when single-precision floating-point value is unpacked.
    constant EXP_SZ  : integer := FLOAT_EXP_SZ;
    constant EXP_LSB : integer := 0;
    constant EXP_MSB : integer := EXP_LSB + EXP_SZ - 1;
    subtype EXP_RANGE is natural range EXP_MSB downto EXP_LSB;
    constant UNBIASED_EXP_SZ  : integer := EXP_SZ + 1;  -- Unbiased exponent is 1 bit larger to avoid overflow
    constant UNBIASED_EXP_LSB : integer := 0;
    constant UNBIASED_EXP_MSB : integer := UNBIASED_EXP_LSB + UNBIASED_EXP_SZ - 1;
    subtype UNBIASED_EXP_RANGE is natural range UNBIASED_EXP_MSB downto UNBIASED_EXP_LSB;
    constant FRAC_SZ  : integer := FLOAT_FRAC_SZ;
    constant FRAC_LSB : integer := 0;
    constant FRAC_MSB : integer := FRAC_LSB + FRAC_SZ - 1;
    subtype FRAC_RANGE is natural range FRAC_MSB downto FRAC_LSB;

    -- Exponent values
    constant EXP_BIAS_VALUE          : integer := 127; -- Bias in floating-point representation
    constant EXP_ZERO_SUBNORMAL      : unsigned(EXP_RANGE) := (others => '0'); -- Biased exponent for zero and subnormals
    constant EXP_INF_NAN             : unsigned(EXP_RANGE) := (others => '1'); -- Biased exponent for infinity and NaN
    constant UNBIASED_EXP_NORMAL_MAX : signed(UNBIASED_EXP_RANGE) := to_signed(127, UNBIASED_EXP_SZ);  -- Max normal exp
    constant UNBIASED_EXP_NORMAL_MIN : signed(UNBIASED_EXP_RANGE) := to_signed(-126, UNBIASED_EXP_SZ); -- Min normal exp

    -- Fraction values
    constant FRAC_INF : unsigned(FRAC_RANGE) := (others => '0'); -- Fraction for infinity

    -- Partial remainder, 3-bit integer, 23-bit fraction, 0.0 <= pr < 8.0
    constant PR_SZ      : integer := 26;
    constant PR_LSB     : integer := 0;
    constant PR_MSB     : integer := PR_LSB + PR_SZ - 1;
    subtype PR_RANGE is natural range PR_MSB downto PR_LSB;

    -- Denominator mantissa, 1-bit integer, 23-bit fraction, 1.0 <= denom_man < 2.0
    constant DENOM_MAN_SZ   : integer := 24;
    constant DENOM_MAN_LSB  : integer := 0;
    constant DENOM_MAN_MSB  : integer := DENOM_MAN_LSB + DENOM_MAN_SZ - 1;
    subtype DENOM_MAN_RANGE is natural range DENOM_MAN_MSB downto DENOM_MAN_LSB;

    -- Denominator mantissa times 3, 3-bit integer, 23-bit fraction, 3.0 <= denom_man_x3 < 6.0
    constant DENOM_MAN_X3_SZ  : integer := 26;
    constant DENOM_MAN_X3_LSB : integer := 0;
    constant DENOM_MAN_X3_MSB : integer := DENOM_MAN_X3_LSB + DENOM_MAN_X3_SZ - 1;
    subtype DENOM_MAN_X3_RANGE is natural range DENOM_MAN_X3_MSB downto DENOM_MAN_X3_LSB;

    -- Quotient mantissa + guard + round bits, 1-bit integer, 25-bit fraction, 0.5 <= quot_man < 2.0
    constant QUOT_MAN_SZ  : integer := 26;
    constant QUOT_MAN_LSB : integer := 0;
    constant QUOT_MAN_MSB : integer := QUOT_MAN_LSB + QUOT_MAN_SZ - 1;
    subtype QUOT_MAN_RANGE is natural range QUOT_MAN_MSB downto QUOT_MAN_LSB;

    -- Quiet NaN. Set guard and round bits to 0 to prevent rounding from changing mantissa.
    constant QUOT_MAN_NAN : unsigned(QUOT_MAN_RANGE) := "11111111111111111111111100"; 

    -- Keeps track of number of cycles div_step() has been run.
    subtype DIV_CNT_RANGE is natural range 3 downto 0;
    constant DIV_CNT_STOP : unsigned(DIV_CNT_RANGE) := "1100"; -- 0 to 12 is 13 times

    -- Registers
    signal pr           : unsigned(PR_RANGE);       -- Partial remainder, 0.0 <= pr < 8.0
    signal denom_man    : unsigned(DENOM_MAN_RANGE); -- Denominator, 1.0 <= denom_man < 2.0
    signal denom_man_x3 : unsigned(DENOM_MAN_X3_RANGE); -- Denominator times 3, 3.0 <= denom_man_x3 < 6.0
    signal quot_sign    : std_logic;                -- Quotient sign bit
    signal quot_unbiased_exp : signed(UNBIASED_EXP_RANGE); -- Quotient exponent (unbiased)
    signal quot_exp     : unsigned(EXP_RANGE);      -- Quotient exponent (biased)
    signal quot_man     : unsigned(QUOT_MAN_RANGE); -- Quotient mantissa + guard + round bits, 0.5 <= quot_man < 2.0
    signal normalize    : std_logic;                -- 1 when quot_man will be less than 1.0 and needs normalization
    signal div_step_en  : std_logic;                -- 1 when div_step() is allowed to perform division
    signal div_cnt      : unsigned(DIV_CNT_RANGE);  -- Keeps track of number of cycles div_step() has been run.
begin                                                                        

    ------------------------
    -- CALCULATE QUOTIENT --
    ------------------------

    process (dataa,datab,clk_en,clk,reset,start,quot_unbiased_exp,quot_man,div_step_en,div_cnt)
        variable quot_biased_exp_tmp: signed(UNBIASED_EXP_RANGE);

        -- Called once at the beginning of a division when "start" is 1.
        procedure setup(
            signal numer_float  : in std_logic_vector(FLOAT_RANGE);
            signal denom_float  : in std_logic_vector(FLOAT_RANGE);
            signal pr           : out unsigned(PR_RANGE);
            signal quot_sign    : out std_logic;
            signal quot_unbiased_exp  : out signed(UNBIASED_EXP_RANGE);
            signal quot_exp     : out unsigned(EXP_RANGE);
            signal quot_man     : out unsigned(QUOT_MAN_RANGE);
            signal denom_man    : out unsigned(DENOM_MAN_RANGE);
            signal denom_man_x3 : out unsigned(DENOM_MAN_X3_RANGE);
            signal normalize    : out std_logic;
            signal div_step_en  : out std_logic) is

            -- Unpack single-precision floating-point value into fields.
            procedure unpack(
                signal float        : in std_logic_vector(FLOAT_RANGE);
                variable sign       : out std_logic;
                variable exp        : out unsigned(EXP_RANGE);
                variable frac       : out unsigned(FRAC_RANGE)) is
            begin
                sign := float(FLOAT_SIGN_LSB);
                exp  := unsigned(float(FLOAT_EXP_RANGE));
                frac := unsigned(float(FLOAT_FRAC_RANGE));
            end procedure unpack;

            -- Determine what kind of number is the exponent/fraction.
            procedure categorize(
                variable exp         : in unsigned(EXP_RANGE);
                variable frac        : in unsigned(FRAC_RANGE);
                variable is_zero     : out std_logic;
                variable is_infinity : out std_logic;
                variable is_nan      : out std_logic) is
            begin
                is_zero := '0';
                is_infinity := '0';
                is_nan := '0';
                if (exp=EXP_ZERO_SUBNORMAL) then
                    -- Fraction ignored so subnormals are treated as zero.
                    is_zero := '1';
                elsif (exp=EXP_INF_NAN) then
                    if (frac=FRAC_INF) then
                        is_infinity := '1';
                    else
                        is_nan := '1';
                    end if;
                end if;
            end procedure categorize;

            -- Combinatorial values
            variable numer_sign         : std_logic;
            variable denom_sign         : std_logic;
            variable numer_exp          : unsigned(EXP_RANGE);
            variable denom_exp          : unsigned(EXP_RANGE);
            variable numer_frac         : unsigned(FRAC_RANGE);
            variable denom_frac         : unsigned(FRAC_RANGE);
            variable numer_is_zero      : std_logic;
            variable numer_is_infinity  : std_logic;
            variable numer_is_nan       : std_logic;
            variable denom_is_zero      : std_logic;
            variable denom_is_infinity  : std_logic;
            variable denom_is_nan       : std_logic;
        begin
            -- Unpack fields in numerator and denominator.
            unpack(numer_float, numer_sign, numer_exp, numer_frac);
            unpack(denom_float, denom_sign, denom_exp, denom_frac);
    
            -- Determine what kind of number is the numerator and denominator.
            categorize(numer_exp, numer_frac, numer_is_zero, numer_is_infinity, numer_is_nan);
            categorize(denom_exp, denom_frac, denom_is_zero, denom_is_infinity, denom_is_nan);
    
            -- Quotient sign is just the XOR of the numerator and denominator sign.
            quot_sign <= numer_sign xor denom_sign;
    
            -- Load partial remainder with numerator * 2 (shift left 1).
            -- Need to multiply numerator by 2 because radix 4
            -- algorithm starts quotient digit selection for the
            -- first two digits at the beginning.
            --
            -- Add hidden bit above fraction. 
            -- Zero-extend by one bit above hidden bit to match integer
            -- size of partial remainder (3 bits) to numerator (1 bit).
            -- This is all done after the implicit left shift.
            pr <= "01" & numer_frac & '0';
            
            -- Denominator mantissa is denom_frac with hidden bit added.
            denom_man <= '1' & denom_frac;
    
            -- Need denominator times 3 for radix-4.
            denom_man_x3 <= ("001" & denom_frac) + ("01" & denom_frac & '0');
    
            -- Quotient unbiased exponent is just numerator exponent less denominator exponent.
            -- The bias is removed because it gets subtracted out from both.
            quot_unbiased_exp <= signed('0' & numer_exp) - signed('0' & denom_exp);
    
            if ((numer_is_infinity='1' and denom_is_infinity='1') or 
                 (numer_is_zero='1' and denom_is_zero='1') or
                 (numer_is_nan='1') or (denom_is_nan='1')) then
                -- This creates a qNaN result for 0/0, infinity/infinity, NaN/x, x/NaN, NaN/NaN.
                quot_exp <= EXP_INF_NAN;
                quot_man <= QUOT_MAN_NAN;
                div_step_en <= '0'; -- Don't compute quotient mantissa with divide step.
            elsif (numer_is_infinity='1' or denom_is_zero='1') then
                -- Produce infinity result for infinity/x, or x/0.
                quot_exp <= EXP_INF_NAN;
                quot_man <= (others => '0');
                div_step_en <= '0'; -- Don't compute quotient mantissa with divide step.
            elsif (numer_is_zero='1' or denom_is_infinity='1') then 
                -- Produce zero result for 0/x, or x/infinity.
                quot_exp <= EXP_ZERO_SUBNORMAL;
                quot_man <= (others => '0');
                div_step_en <= '0'; -- Don't compute quotient mantissa with divide step.
            else                                        
                -- Setup for normal division.  Can't figure out
                -- final exponent value yet until normalization
                -- has a crack at adjusting in a later cycle.
                quot_man <= (others => '0');
                div_step_en <= '1'; -- Compute quotient mantissa with divide step.
            end if;                        

            -- If numerator fraction is less than the denominator fraction,
            -- the quotient fraction will be less than 1.0 (minimum will be 0.5) and 
            -- so it will need an extra left shift of 1 to normalize it.
            if (numer_frac < denom_frac) then
                normalize <= '1';
            else
                normalize <= '0';
            end if;
        end procedure setup;

        -- Called every cycle after start.
        -- Creates 26 quotient mantissa bits in 13 cycles.
        procedure div_step(
            signal pr           : inout unsigned(PR_RANGE);
            signal quot_man     : inout unsigned(QUOT_MAN_RANGE);
            signal denom_man    : in unsigned(DENOM_MAN_RANGE);
            signal denom_man_x3 : in unsigned(DENOM_MAN_X3_RANGE);
            signal normalize    : in std_logic) is

            -- Combinatorial values
            variable pr_less_denom_mul  : unsigned(DENOM_MAN_X3_RANGE);
            variable quot_bits          : unsigned(1 downto 0);
        begin
            -- Choose the quotient bits based on the largest multiple
            -- of the denominator that is larger than the partial remainder.
            -- This is known in the industry as the "Brute Force" technique.
            if (pr >= denom_man_x3) then
                -- Choose denom_man * 3.
                pr_less_denom_mul := pr - denom_man_x3;
                quot_bits := "11";
            elsif (pr(25 downto 1) >= denom_man) then
                -- Choose denom_man * 2.
                pr_less_denom_mul := pr - (denom_man & '0');
                quot_bits := "10";
            elsif (pr >= denom_man) then
                -- Choose denom_man * 1.
                pr_less_denom_mul := pr - denom_man;
                quot_bits := "01";
            else
                -- Choose denom_man * 0.
                pr_less_denom_mul := pr;
                quot_bits := "00";
            end if;

            -- Shift in 2 quotient bits (radix 4).
            if (normalize='1') then
                -- If normalizing, do an extra left shift of 1.
                quot_man <= quot_man(23 downto 1) & quot_bits & '0';
            else 
                quot_man <= quot_man(23 downto 0) & quot_bits;
            end if;

            -- Create new pr value by shifting pr_less_denom_mul left 2 bits.
            pr <= pr_less_denom_mul(23 downto 0) & "00";
        end procedure div_step;
    
    begin
    if (reset = '1') then
        pr <= (others => '0');
        denom_man <= (others => '0');
        denom_man_x3 <= (others => '0');
        quot_sign <= '0';
        quot_exp <= (others => '0');
        quot_man <= (others => '0');
        normalize <= '0';
        div_step_en <= '0';
        div_cnt <= (others => '0');
    else  
        if (clk'event and clk='1') then
            if (clk_en='1') then
                if (start='1') then                    
                    -- Set signals dependant on dataa and datab (numerator and denominator) inputs.
                    -- These inputs are only valid when start is 1.
                    setup(dataa, datab, pr, quot_sign, quot_unbiased_exp, quot_exp, quot_man, 
                      denom_man, denom_man_x3, normalize, div_step_en);

                    -- Start count at zero.
                    div_cnt <= (others => '0'); 
                end if;

                if (div_step_en='1') then
                    -- Choose quotient bits every cycle that divide step is enabled.
                    div_step(pr, quot_man, denom_man, denom_man_x3, normalize); 

                    if (div_cnt=0) then
                        -- First cycle of divide step.
                        -- Subtract one from exponent if normalization required.
                        if (normalize='1') then
                            quot_unbiased_exp <= quot_unbiased_exp - 1;
                        end if;
                    elsif (div_cnt=1) then
                        -- Second cycle of divide step.
                        -- The unbiased exponent now has been adjusted by normalization
                        -- (if required) so it is safe to check for overflow/underflow
                        -- and create the final biased exponent value.
                        if (quot_unbiased_exp > UNBIASED_EXP_NORMAL_MAX) then
                            -- Produce infinity result for overflow of exponent.
                            quot_exp <= EXP_INF_NAN;
                            quot_man <= (others => '0');
                            div_step_en <= '0';
                        elsif (quot_unbiased_exp < UNBIASED_EXP_NORMAL_MIN) then 
                            -- Produce zero result for underflow of exponent (flush to zero).
                            quot_exp <= EXP_ZERO_SUBNORMAL;
                            quot_man <= (others => '0');
                            div_step_en <= '0';
                        else
                            -- Add bias to exponent and limit size to exponent range.
                            quot_biased_exp_tmp := quot_unbiased_exp + EXP_BIAS_VALUE;
                            quot_exp <= unsigned(quot_biased_exp_tmp(EXP_RANGE));
                        end if;
                    end if;

                    -- Increment div_cnt until unless it is done.
                    if (div_cnt=DIV_CNT_STOP) then
                        -- The div_step() has been run the
                        -- required number of times so stop it.
                        div_step_en <= '0';
                        div_cnt <= (others => '0');
                    else
                        div_cnt <= div_cnt + 1;
                    end if;
                end if;
            end if; -- clk_en
        end if; -- clk event
    end if; -- reset
    end process;

    --------------------
    -- ROUND QUOTIENT --
    --------------------

    process (quot_sign,quot_exp,quot_man)

    -- Combinatorial signals
    variable plus_one   : unsigned(31 downto 0);    -- Exponent and mantissa + 1

    begin

    -- Quotient mantissa is 26 bits and contains 1 integer bit and 25 fraction bits.
    -- Bit 25 (integer bit) must be 1 because mantissa is normalized at this point so it is removed.
    -- Bits 24 to 2 contain the 23-bit fraction.
    -- Bit 1 contains an extra fraction bit (with value 1/2 ulp) for rounding.
    -- Bit 0 isn't need and is only here because this is a radix 4 algorithm so it can along for the ride.
    --
    -- Round-to-nearest-tie-rounds-away is simply implemented by adding 1 to bit 1 (adds 1/2 ulp) and 
    -- truncating the result to 23 bits.
    --
    -- Don't have to worry about the addition of 1/2 ulp causing the exponent to
    -- increment and change the underflow/overflow situation. This is because in
    -- order for the addition of 1/2 ulp to carry into the exponent, the mantissa
    -- would have to be all ones and the extra fraction bit would also have to be 1. 
    -- If the quotient mantissa is all ones, you can't have the extra fraction bit be 1 because
    -- the quotient mantisssa is never larger than the numerator mantissa 
    -- (1.0 <= denominator mantissa < 2) and there is no extra fraction bit for the numerator
    -- mantissa (so it is implicitly 0).
    plus_one := (quot_exp & quot_man(24 downto 1)) + 1;

    -- Quotient is sign concatenated with the exponent/mantissa plus 1 with bit 0 truncated
    -- to create the final 8-bit exponent and 23-bit rounded fraction.
    result <= quot_sign & std_logic_vector(plus_one(31 downto 1));

    end process;
end beh;
