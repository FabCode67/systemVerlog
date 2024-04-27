library verilog;
use verilog.vl_types.all;
entity mux4to1_32bit_tb is
    generic(
        WIDTH           : integer := 32;
        ITERATIONS      : integer := 10
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
    attribute mti_svvh_generic_type of ITERATIONS : constant is 1;
end mux4to1_32bit_tb;
