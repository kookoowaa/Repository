def string_head(text, length = 15, indicator = '...'):
    if len(text) > length:
        text = text[:length - len(indicator)] + indicator
    return text