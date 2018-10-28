pub fn find() -> Option<u32> {
    let s = 1000;

    for a in 1u32..s {
        for b in 1u32..s {
            for c in 1u32..s {
                if a < b && b < c && a.pow(2) + b.pow(2) == c.pow(2) && a + b + c == s {
                    return Some(a * b * c);
                }
            }
        }
    }

    None
}
