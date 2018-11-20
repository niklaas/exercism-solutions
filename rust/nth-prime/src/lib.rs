pub fn nth(n: u32) -> u32 {
    let mut primes: Vec<u32> = Vec::with_capacity(n as usize);
    let mut check: u32 = 3;

    primes.push(2);

    while primes.len() <= n as usize {
        if primes.iter().all(|&p| check % p != 0) {
            primes.push(check);
        }
        check += 1;
    }

    // Because we know that primes holds at least one value, we can use unwrap().
    primes.pop().unwrap()
}
