library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use work.myfuncs.all;

entity compteur_gray is

-- clk, reset, clk2, enable and count_out only

generic (
		div2 : integer range 0 to 1 := 1;	 		-- indique si on place d'abord un diviseur par 2
    bit_size : integer := 4);
		-- default/ori code without bit_size

port (
		clk,reset,clk2 : in std_logic;		-- horloge d'entre, reset et horloge d'échantillonnage
		enable     		 : in std_logic;			-- autorisation de fonctionnement
    factor    		 : in unsigned(bit_size-1 downto 0);	-- facteur de division
    count_out 		 : out unsigned(bit_size-1 downto 0);	-- compteur de division
    clock_out 		 : out std_logic);			-- horloge divisee generee
		-- default size of factor and count_out = 7 (6 downt to 0)
end compteur_gray ;
