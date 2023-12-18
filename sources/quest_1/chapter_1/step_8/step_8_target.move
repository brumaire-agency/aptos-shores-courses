module robinson::my_shore {

    struct GlobalData has key {
        nb_tree: u8,
        has_river: bool,
        shore_location: address,
        nb_trees: vector<u8>,
    }
    use  std::signer;
    fun shores(s: signer) {
        assert!(signer::address_of(&s) == @0x42, 0);
    }
 }