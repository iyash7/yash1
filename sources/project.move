module MyModule::GigEconomyPlatform {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;
    use std::vector;

    /// Struct representing a gig or freelance job.
    struct Gig has store, key {
        poster: address,         // Address of the job poster
        description: vector<u8>, // Description of the gig
        reward: u64,             // Reward for completing the gig
        is_completed: bool,      // Whether the gig has been completed
    }

    /// Function to post a new gig.
    public fun post_gig(poster: &signer, description: vector<u8>, reward: u64) {
        let gig = Gig {
            poster: signer::address_of(poster),
            description,
            reward,
            is_completed: false,
        };
        move_to(poster, gig);
    }

    /// Function to complete a gig and receive payment.
    public fun complete_gig(worker: &signer, poster_address: address) acquires Gig {
        let gig = borrow_global_mut<Gig>(poster_address);

        // Ensure the gig is not already completed
        assert!(!gig.is_completed, 1);

        // Mark the gig as completed
        gig.is_completed = true;

        // Transfer the reward from the job poster to the worker
        
    }
}
