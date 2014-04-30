class ManModel < NSOperation

  include CDQ

  def set_detail(counter, queue)
    @counter = counter
    @queue = queue
    self
  end

  def main
    p "Main man"
    cdq.contexts.new(NSConfinementConcurrencyType) do
      5_000.times do |i|
        man = Man.create({
            name: "Man #{i}"
                   })
        # apple = Apple.create({
        #     name: "Apple #{i}"
        #                      })

        apple = man.apples.create({
            name: "Apple #{i}"
                             })
      end
      cdq.save
    end
    if @counter <= 3
      operation = ManModel.new.set_detail(@counter + 1, @queue)
      @queue.addOperation(operation)
    end
  end
end