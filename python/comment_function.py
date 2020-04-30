def test(a: int = 0, b: str = '') -> str:
    """ This is function test :D
    Happy coding
    Comment line 1
    Comment line 2
    Comment line N

    Args:
        a (int): Variable a
        b (atr): variable b

    Returns:
        str: result b with a
    """
    return b %a


print(test(100, 'result = %s'))
