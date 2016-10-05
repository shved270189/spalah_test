class ShopService
  SHOP_URL = 'https://www.olx.ua/'
  PRODUCT_SELECTOR = '#body-container #mainpageAds li'
  PRICE_SELECTOR = '.price'
  IMAGE_SELECTOR = 'img'
  DESCRIPTION_SELECTOR = '.inner h4 a.detailsLinkPromoted strong'

  class << self
    def products
      shop_dom.css(PRODUCT_SELECTOR).map do |product_dom|
        {
          price: price(product_dom.css(PRICE_SELECTOR)),
          image_url: image_url(product_dom.css(IMAGE_SELECTOR)),
          description: description(product_dom.css(DESCRIPTION_SELECTOR))
        }
      end
    end

    private

    def shop_dom
      @shop_dom ||= Nokogiri::HTML(open(SHOP_URL))
    end

    def price(price_dom)
      price_dom.text.gsub('Договорная', '').strip # .gsub("\t", '').gsub("\n", '').gsub(' ', '').gsub('Договорная', '')
    end

    def image_url(image_dom)
      image_dom.attribute('src').text if image_dom.present?
    end

    def description(description_dom)
      description_dom.text
    end
  end
end
