class Post < ApplicationRecord
    belongs_to :user # n쪽에서 1을 바라볼때는 1개만 있기때문에 단수
end
