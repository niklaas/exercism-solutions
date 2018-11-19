pub fn reverse(input: &str) -> String {
    let mut out = String::new();

    for c in input.chars() {
        out.insert(0, c)
    }

    out
}
