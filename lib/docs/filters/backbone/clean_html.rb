module Docs
  class Backbone
    class CleanHtmlFilter < Filter
      def call
        # Remove Introduction, Upgrading, etc.
        while doc.child['id'] != 'Events'
          doc.child.remove
        end

        # Remove Examples, FAQ, etc.
        while doc.children.last['id'] != 'examples'
          doc.children.last.remove
        end

        css('#examples', '.run').remove

        css('tt').each do |node|
          node.name = 'code'
        end

        doc
      end
    end
  end
end
