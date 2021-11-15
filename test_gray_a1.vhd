architecture a1 of test_gray is

----------------------------------------------------
-- tous les composants  connecter
----------------------------------------------------
component compteur_gray is
generic (
		div2 : integer;  -- indique si on place d'abord un diviseur par 2
    bit_size : integer := 4);
port ( clk,reset,clk2 : in std_logic;		-- horloge d'entre et reset
    enable    : in std_logic;
    factor    : in unsigned(bit_size-1 downto 0);	-- facteur de division
    count_out : out unsigned(bit_size-1 downto 0);	-- compteur de division
    clock_out : out std_logic);		-- horloge divise
end component ;

component digital_gene IS
		generic (bit_size : integer := 4);
    PORT(
        reset      : OUT std_logic;
        enable     : OUT std_logic;
				factor     : OUT unsigned(bit_size-1 downto 0); -- facteur de division
        clk,clk2   : OUT std_logic
    );
end component;

---------------------------------
-- tous les signaux locaux
---------------------------------
signal reset,enable : std_logic ;	 -- reset et autorisation de la logique
signal clk,clk2 : std_logic ;	 -- horloge de rfrence  10 Mhz du GSM
signal clock_out : std_logic ;		-- horloge de sortie du DCO

-- why cannot assign bit_size here?
signal factor : unsigned(3 downto 0) ;	-- facteur de division

-- why cannot assign bit_size here?
signal count_out : unsigned(3 downto 0) ;   -- phase attendue

begin

-- instantiation de tous les composants
----------------------------------------

c1 : digital_gene  port map(reset,enable,factor,clk,clk2) ;
c2 : compteur_gray generic map(div2 => 1)
	port map(clk,reset,clk2,enable,factor,count_out,clock_out) ;


end architecture a1 ;
